import AVFoundation
import Foundation
import UIKit

class MusicFlowCoordinator {
    var player: AVAudioPlayer?
    let music = Songs.getMusics()
    var filtedMusic = [Music]()
    var currentSinger: Int = 0
    var before: String = ""
    var currentSoundsIndex: Int?
    var first = 0
    
    let navigationController = UINavigationController()
    
    var rootViewController: UIViewController {
        return navigationController
    }
    
    func start() {
        let controller = MainViewFactory.make(delegate: self,
                                              musicList: music,
                                              currentSinger: currentSinger,
                                              currentSongIndex: 0)
        navigationController.pushViewController(controller, animated: true)
    }
    
    func openSongList(singer: String) {
        let controller = SongListFactory.make(delegate: self,
                                              singerSelected: singer)
        controller.modalPresentationStyle = .fullScreen
        navigationController.navigationBar.isHidden = true
        navigationController.pushViewController(controller, animated: true)
    }
    
    func openPlayerView(singer: String,
                        illustration: String,
                        songName: String) {
        let controller = PlayerViewFactory.make(delegate: self,
                                                singer: singer,
                                                illustration: illustration,
                                                songName: songName)
        navigationController.navigationBar.isHidden = true
        navigationController.pushViewController(controller, animated: true)
    }
}

extension MusicFlowCoordinator: MainViewDelegate {
    func perform(action: MainViewAction) {
        switch action {
        case let .play(currentSong):
            resumeNow(currentSong: currentSong)
        case .pause:
            player?.pause()
        case .forward:
           forwardMusic(singer: "", song: "")
        case let .previous(singer, song):
            forwardMusic(singer: singer, song: song)
           // previousSong(singer: singer, song: song)
        case let .openSongList(singerSelected):
            openSongList(singer: singerSelected)
        case let .openPlayer(singer, illustration, songName):
            openPlayerView(singer: singer,
                           illustration: illustration,
                           songName: songName)
        case .dismiss:
            navigationController.dismiss(animated: true)
        }
    }
}
extension MusicFlowCoordinator {
    func resumeNow(currentSong: String?) {
        guard let song = currentSong else { return }
        if song != before {
            playSound(currentSong: song)
        } else if ((player?.play()) != nil) {
            
        } else {
            playSound(currentSong: song)
        }
    }
    
    func playSound(currentSong: String? = nil, songIndex: Int = 0){
        player?.stop()
        
        let song = currentSong ?? filtedMusic[songIndex].songName
        
        guard let url = Bundle.main.url(forResource: song, withExtension: "mp3") else { return }
        
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
            
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)
            
            player?.prepareToPlay()
            
            guard let player = player else { return }
            
            player.play()
            
            
        } catch let error {
            print(error.localizedDescription)
            
        }
    }
    
    func filterMusic(singer: String, currentSong: String) -> Int {
        let filter = music.filter({ $0.name == singer })
        
        filter.forEach { songs in
            songs.music.forEach { music in
                filtedMusic.append(music)
            }
        }
        
        guard let songIndex: Int = filtedMusic.firstIndex(where: { $0.songName == currentSong}) else { return 0 }
        
        return songIndex
    }
    
    func previousSong(singer: String, song: String) {
        let songIndex = filterMusic(singer: singer, currentSong: song)
        
        var index: Int = currentSoundsIndex ?? songIndex
        
        if index <= 0 {
            index = filtedMusic.count
        }
        
        index -= 1 % filtedMusic.count
        
        currentSoundsIndex = index
        playSound(currentSong: nil, songIndex: index)
        
    }
    
    func forwardMusic(singer: String, song: String) {
        let songIndex = filterMusic(singer: singer, currentSong: song)
        
        var index: Int = currentSoundsIndex ?? songIndex
        
        if index >= filtedMusic.count {
            index = 0
        }
        
        index += 1 % filtedMusic.count
        
        currentSoundsIndex = index
        playSound(currentSong: nil, songIndex: index)
    }
}
