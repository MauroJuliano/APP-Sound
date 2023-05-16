import Foundation
import UIKit

protocol MainViewInterating {
    func loadSongs()
    func playSong()
    func openSongList(singer: String)
    func pauseSong()
    var currentSinger: Int { get set }
    var currentSongIndex: Int { get set }
}

class MainViewInteractor: MainViewInterating {
    var currentSinger: Int
    var currentSongIndex: Int
    var musicList: [Singer]
    var presenter: MainViewPresenting
    
    init(presenter: MainViewPresenting,
         musicList: [Singer],
         currentSinger: Int,
         currentSongindex: Int) {
        self.presenter = presenter
        self.musicList = musicList
        self.currentSinger = currentSinger
        self.currentSongIndex = currentSongindex
    }
    
    func loadSongs() {
        presenter.displayScreen(musicList: musicList, currentSong: currentSongIndex, currentSinger: currentSinger)
    }
    
    func playSong() {
        presenter.presenterPerform(action: .play(currentSong: "lovely"))
    }
    
    func pauseSong() {
        presenter.presenterPerform(action: .pause)
    }
    
    func openSongList(singer: String) {
        presenter.presenterPerform(action: .openSongList(singerSelected: singer))
    }
}
