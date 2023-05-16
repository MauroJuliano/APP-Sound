import UIKit

enum SongListFactory {
    static func make(delegate: MainViewDelegate,
                     singerSelected: String) -> UIViewController {
        let coordinator = SongListCoordinator(delegate: delegate)
        let presenter = SongListPresenter(coordinator: coordinator)
        let interactor = SongListInteractor(presenter: presenter,
                                            singerSelected: singerSelected)
        let controller = SongListViewController(interactor: interactor)
        
        presenter.viewController = controller
        
        return controller
    }
}
