//
//  Music.swift
//  APP-Sound
//
//  Created by Lestad on 2021-02-28.
//

import Foundation

class Music {
    var songName: String?
    var songAutor: String?
    var songImage: String?
    var songAlbum: String?
    var isFavorite: Bool?
    
    init(songName: String, songAutor: String, songImage: String, songAlbum: String, isFavorite: Bool) {
        self.songName = songName
        self.songAutor = songAutor
        self.songImage = songImage
        self.songAlbum = songAlbum
        self.isFavorite = isFavorite
    }
}
