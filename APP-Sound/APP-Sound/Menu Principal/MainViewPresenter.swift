import Foundation
import UIKit

protocol MainViewPresenting: AnyObject {
    func presenterPerform(action: MainViewAction)
    func displayScreen(musicList: [Singer], currentSong: Int, currentSinger: Int)
  
}

final class MainViewPresenteer: MainViewPresenting {
    private var coordinator: MainViewCoordinating
    weak var viewController: MainViewDisplaying?
    
    init(coordinator: MainViewCoordinating) {
        self.coordinator = coordinator
    }
    
    func displayScreen(musicList: [Singer], currentSong: Int, currentSinger: Int) {
        viewController?.musics = musicList
        let currentSongName = musicList[currentSinger].music[currentSong]
        viewController?.displayScreen(musicInfo: currentSongName)
    }
    
    func presenterPerform(action: MainViewAction) {
        coordinator.player(action: action)
        switch action {
        case .play:
            viewController?.playButton(isSelected: true)
        case .pause:
            viewController?.playButton(isSelected: false)
        default:
            print("do nothing")
        }
    }
}
