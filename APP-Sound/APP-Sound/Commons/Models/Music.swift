import Foundation

class Singer {
    var name: String
    var image: String
    var music: [Music]
    
    init(name: String,image: String, music: [Music]) {
        self.name = name
        self.image = image
        self.music = music
    }
}

class Music {
    var songName: String
    var songAutor: String
    var songImage: String
    var songAlbum: String
    var isFavorite: Bool
    
    init(songName: String, songAutor: String, songImage: String, songAlbum: String, isFavorite: Bool) {
        self.songName = songName
        self.songAutor = songAutor
        self.songImage = songImage
        self.songAlbum = songAlbum
        self.isFavorite = isFavorite
    }
}


