import UIKit


protocol PlayerViewPresenting: AnyObject {
    func perform(action: MainViewAction)
    func displayScreen(singer: String, illustration: String, songName: String)
}

final class PlayerViewPresenter: PlayerViewPresenting {
    private var coordinator: PlayerViewCoordinating
    weak var viewController: PlayerViewDisplaying?
    
    init(coordinator: PlayerViewCoordinating) {
        self.coordinator = coordinator
    }
    
    func perform(action: MainViewAction) {
        coordinator.perform(action: action)
    }
    
    func displayScreen(singer: String, illustration: String, songName: String) {
        viewController?.displayScreen(singer: singer, illustration: illustration, songName: songName)
    }
}
