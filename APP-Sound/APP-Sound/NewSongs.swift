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
        
        musicArray.append(Music(songName: "Somebody That I Used to Know", songAutor: "Gotye", songImage: "gotye", songAlbum: "Making Mirrors", isFavorite: false))
        musicArray.append(Music(songName: "Childhood dreams", songAutor: "Seraphine", songImage: "seraphine", songAlbum: "Seraphine", isFavorite: false))
        musicArray.append(Music(songName: "you make that way", songAutor: "Seraphine", songImage: "seraphine", songAlbum: "Seraphine", isFavorite: false))
        musicArray.append(Music(songName: "MORE", songAutor: "KDA Feat. Seraphine", songImage: "kda", songAlbum: "KDA All Out", isFavorite: true))
        musicArray.append(Music(songName: "Bellyache", songAutor: "Billie Eilish", songImage: "billie", songAlbum: "Billie Eilish", isFavorite: true))
        musicArray.append(Music(songName: "i dont wanna be you anymore", songAutor: "Billie Eilish", songImage: "billie", songAlbum: "Billie Eilish", isFavorite: true))
        musicArray.append(Music(songName: "lovely", songAutor: "Billie Eilish", songImage: "billie", songAlbum: "Billie Eilish", isFavorite: true))
        musicArray.append(Music(songName: "Drum go dum", songAutor: "Kai'sa", songImage: "kaisa", songAlbum: "Kai'sa", isFavorite: true))
        
        completionHandler(true,nil)
    }
    
}
