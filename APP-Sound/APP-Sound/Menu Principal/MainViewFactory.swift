import UIKit

enum MainViewFactory {
    static func make(delegate: MainViewDelegate,
                     musicList: [Singer],
                     currentSinger: Int,
                     currentSongIndex: Int) -> UIViewController {
        let coordinator = MainViewCoordinator(delegate: delegate)
        let presenter = MainViewPresenteer(coordinator: coordinator)
        let interactor = MainViewInteractor(presenter: presenter,
                                            musicList: musicList,
                                            currentSinger: currentSinger,
                                            currentSongindex: currentSongIndex)
        let controller = MainViewController(interactor: interactor)
        
        presenter.viewController = controller
        
        return controller
    }
}
