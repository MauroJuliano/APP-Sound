import UIKit

protocol PlayerViewInteracting {
    func loadSong()
    func playSong(currentSong: String)
    func pauseButton()
    func previousButton(singer: String, song: String)
    func forwardButton()
    func openSonglist()
}

class PlayerViewInteractor: PlayerViewInteracting {
    var presenter: PlayerViewPresenting
    var singer: String
    var illustration: String
    var songName: String
    
    init(presenter: PlayerViewPresenting,
         singer: String,
         illustration: String,
         songName: String) {
        self.presenter = presenter
        self.singer = singer
        self.illustration = illustration
        self.songName = songName
        
    }
    
    func loadSong() {
        presenter.displayScreen(singer: singer,
                                illustration: illustration,
                                songName: songName)
    }
    
    func playSong(currentSong: String) {
        presenter.perform(action: .play(currentSong: currentSong))
    }
    
    func openSonglist() {
        presenter.perform(action: .dismiss)
    }
    
    func pauseButton() {
        presenter.perform(action: .pause)
    }
    
    func previousButton(singer: String, song: String) {
        presenter.perform(action: .previous(singer: singer, song: song))
    }
    
    func forwardButton() {
        presenter.perform(action: .forward)
    }
}
