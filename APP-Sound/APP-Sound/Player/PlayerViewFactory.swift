import UIKit

enum PlayerViewFactory {
    static func make(delegate: MainViewDelegate,
                     singer: String,
                     illustration: String,
                     songName: String) -> UIViewController {
        let coordinator = PlayerViewCoordinator(delegate: delegate)
        let presenter = PlayerViewPresenter(coordinator: coordinator)
        let interactor = PlayerViewInteractor(presenter: presenter,
                                              singer: singer,
                                              illustration: illustration,
                                              songName: songName)
        let controller = PlayerViewController(interactor: interactor)
        
        presenter.viewController = controller
        
        return controller
    }
}
