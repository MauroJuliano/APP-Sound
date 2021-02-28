//
//  SongListController.swift
//  APP-Sound
//
//  Created by Lestad on 2021-02-28.
//

import Foundation
import UIKit

class SongListController: NSObject, UITableViewDelegate, UITableViewDataSource {
  
    var view: SongListViewController?
    var songsArray = [Music]()
    init(view: SongListViewController) {
        self.view = view
    }
    
    func arraySetup(){
            if let arrayAlbum = view?.musicArray.filter({ $0.songAutor == "Seraphine"}){
                self.songsArray.append(contentsOf: arrayAlbum)
            }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return songsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SongList", for: indexPath) as! SongListTableViewCell
        let array = songsArray[indexPath.row]
        cell.setup(music: array)
        
        return cell
    }
}
