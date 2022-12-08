import Foundation
import UIKit
import AVFoundation

class SongListViewModel: NSObject {
    var player: AVAudioPlayer?
    var view: SongListViewController?
    var songsArray = [Music]()
    var song = ""
    
    init(view: SongListViewController) {
        self.view = view
    }
    
    func nextView(music: Music?) {
        if let storyboard = UIStoryboard(name: "Player", bundle: nil).instantiateInitialViewController() as? PlayerViewController {
            storyboard.modalPresentationStyle = .fullScreen
            storyboard.musicSelected = music
            player?.stop()
            view!.present(storyboard, animated: true, completion: nil)
        }
    }
    
    func playSound(currentSong: String){
        player?.stop()
        
        guard let url = Bundle.main.url(forResource: currentSong, withExtension: "mp3") else { return }
        
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
            
            /* The following line is required for the player to work on iOS 11. Change the file type accordingly*/
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)
            
            /* iOS 10 and earlier require the following line:
             player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileTypeMPEGLayer3) */
            
            guard let player = player else { return }
            
            player.play()
            
            
        } catch let error {
            print(error.localizedDescription)
            
        }
    }
    
    func pausePlayer() {
        player?.pause()
    }
    
    func resumeNow(currentSong: String) {
        if currentSong != song {
            playSound(currentSong: currentSong)
        } else if ((player?.play()) != nil) {
            /* Intentionally unimplemented */
        } else {
            playSound(currentSong: currentSong)
        }
    }
    
}
