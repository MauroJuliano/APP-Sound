import Foundation

enum MainViewAction {
    case play(currentSong: String? = nil)
    case pause
    case forward
    case previous(singer: String, song: String)
    case openPlayer(singer: String, illustration: String, songName: String)
    case openSongList(singerSelected: String)
    case dismiss
}

protocol MainViewDelegate: AnyObject {
    func perform(action: MainViewAction)
}

protocol MainViewCoordinating {
    func player(action: MainViewAction)
}

class MainViewCoordinator: MainViewCoordinating {
    var delegate: MainViewDelegate
    
    init(delegate: MainViewDelegate) {
        self.delegate = delegate
    }
    
    func player(action: MainViewAction) {
        delegate.perform(action: action)
    }
}
