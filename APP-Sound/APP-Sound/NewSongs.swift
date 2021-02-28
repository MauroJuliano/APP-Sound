//
//  NewSongs.swift
//  APP-Sound
//
//  Created by Lestad on 2021-02-28.
//

import Foundation

class NewSong {
    var musicArray = [Music]()
    
    func addNewSongs(completionHandler: @escaping (_ result: Bool, _ error: Error?) -> Void){
        
        musicArray.append(Music(songName: "Somebody That I Used To Know", songAutor: "Gotye", songImage: "Gotye", songAlbum: "Making Mirrors", isFavorite: false))
        musicArray.append(Music(songName: "ChildHood Dreams", songAutor: "Seraphine", songImage: "Gotye", songAlbum: "Seraphine", isFavorite: false))
        musicArray.append(Music(songName: "you make that way", songAutor: "Seraphine", songImage: "Gotye", songAlbum: "Seraphine", isFavorite: false))
        musicArray.append(Music(songName: "MORE", songAutor: "KDA Feat. Seraphine", songImage: "Gotye", songAlbum: "KDA All Out", isFavorite: false))
        
        completionHandler(true,nil)
    }
    
}
