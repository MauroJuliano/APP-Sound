//
//  PlayListController.swift
//  APP-Sound
//
//  Created by Lestad on 2021-02-28.
//

import Foundation
import UIKit
import AVFoundation
class PlayListController: NSObject, UICollectionViewDelegate, UICollectionViewDataSource {
    var view: ViewController?
    var albumMusic = [Music]()
    var alreadyHas = [String]()
    var artistName = ""
    
    init(view: ViewController){
        self.view = view
    }
    func arraySetup(completionHandler: @escaping (_ result: Bool) -> Void){
        if let arrayTeste = view?.musicArray {

            for itens in arrayTeste {
                artistName = itens.songAlbum!
                if alreadyHas.contains(artistName){
                    //do nothing
                }else{
                    albumMusic.append(itens)
                    alreadyHas.append(itens.songAlbum!)
                    completionHandler(true)
                }
                }
        }
    }
    
    func getFavorites(){

            if let favorites = view?.musicArray.filter({$0.isFavorite == true}){
                    view?.favoritesLabel.text = "\(favorites.count)"
                }
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("clicked")
        if let storyboard = UIStoryboard(name: "SongList", bundle: nil).instantiateInitialViewController() as? SongListViewController {
            storyboard.albumSelected = albumMusic[indexPath.row]
            storyboard.modalPresentationStyle = .fullScreen
            view?.present(storyboard, animated: true, completion: nil)
        }
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return albumMusic.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PlayListCell", for: indexPath) as! PlayListsCollectionViewCell
        cell.setup(music: albumMusic[indexPath.row])
        return cell
    }
    
    
}
