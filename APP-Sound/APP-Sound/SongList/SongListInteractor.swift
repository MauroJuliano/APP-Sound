import UIKit

protocol SongListInteracting {
    func loadData()
    func playSong(currentSong: String)
    func pauseSong()
    func nextSong()
    func previousSong()
    func openPlayer(singer: String, illustration: String, songName: String)
}

class SongListInteractor: SongListInteracting {
    var presenter: SongListPresenting
    var singerSelected: String
    
    init(presenter: SongListPresenting, singerSelected: String) {
        self.presenter = presenter
        self.singerSelected = singerSelected
    }
    
    func loadData() {
        presenter.displayScreen(singer: singerSelected)
    }
    
    func playSong(currentSong: String) {
        presenter.perform(action: .play(currentSong: currentSong))
    }
    
    func pauseSong() {
        presenter.perform(action: .pause)
    }
    
    func nextSong() {
        presenter.perform(action: .forward)
    }
    
    func previousSong() {}
    
    func openPlayer(singer: String, illustration: String, songName: String) {
        presenter.perform(action: .openPlayer(singer: singer, illustration: illustration, songName: songName))
    }
}
