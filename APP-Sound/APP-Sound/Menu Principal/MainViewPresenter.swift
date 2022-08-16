import Foundation
import UIKit

class MainViewPresenter: NSObject {
    var viewController: MainViewController?
    var musicController = NewSong()
    var musicArray = [Music]()
    var albumMusic = [Music]()
    var alreadyHas = [String]()
    
    init(view: MainViewController){
        self.viewController = view
    }
    
    func getSongs(){
        musicController.addNewSongs(completionHandler: { success, _ in
            if success {
                self.musicArray.append(contentsOf: self.musicController.musicArray)
                self.getMusic()
            }
        })
    }
    
    func getMusic() {
        musicArray.forEach { (itens) in
            if !alreadyHas.contains(itens.songAutor){
                albumMusic.append(itens)
                alreadyHas.append(itens.songAlbum)
            }
        }
        
        viewController?.displayScreen(viewModel: albumMusic)
    }
    
    func getFavorites(){
        let favorites = musicArray.filter({$0.isFavorite == true})
        // TODO: Implement favorites next PR
    }
}
