import UIKit

protocol SongListPresenting: AnyObject {
    func perform(action: MainViewAction)
    func displayScreen(singer: String)
}

final class SongListPresenter: SongListPresenting {
    private var coordinator: SongListCoordinating
    weak var viewController: SongListDisplaying?
    
    init(coordinator: SongListCoordinating) {
        self.coordinator = coordinator
    }
    
    func perform(action: MainViewAction) {
        coordinator.player(action: action)
    }
    
    func displayScreen(singer: String) {
        viewController?.displayScreen(singer: singer)
    }
}
