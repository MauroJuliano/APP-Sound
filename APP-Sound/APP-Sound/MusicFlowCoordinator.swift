import AVFoundation
import Foundation
import UIKit

class MusicFlowCoordinator {
    var player: AVAudioPlayer?
    
    let navigationController = UINavigationController()
    
    var rootViewController: UIViewController {
        return navigationController
    }
    
    func start() {
        let controller = MainViewFactory.make(delegate: self)
        navigationController.pushViewController(controller, animated: true)
    }
}

extension MusicFlowCoordinator: MainViewDelegate {
    func getSongs2() {
        print("clicou")
    }   
}
