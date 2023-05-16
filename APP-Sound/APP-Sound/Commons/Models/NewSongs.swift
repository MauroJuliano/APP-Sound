//
import Foundation

enum Songs {
    static func getMusics() -> [Singer] {
        var album = [Singer]()
        album.append(Singer(name: "Gotye",
                            image: "gotye",
                            music: [Music(songName: "Somebody That I Used to Know",
                                          songAutor: "Gotye",
                                          songImage: "gotye",
                                          songAlbum: "Making Mirrors",
                                          isFavorite: false)]))
        album.append(Singer(name: "Billie Eilish",
                            image: "billie",
                            music: [Music(songName: "i dont wanna be you anymore",
                                          songAutor: "Billie Eilish",
                                          songImage: "billie",
                                          songAlbum: "Billie Eilish",
                                          isFavorite: true),
                                    Music(songName: "Bellyache",
                                          songAutor: "Billie Eilish",
                                          songImage: "billie",
                                          songAlbum: "Billie Eilish",
                                          isFavorite: true),
                                    Music(songName: "lovely",
                                          songAutor: "Billie Eilish",
                                          songImage: "billie",
                                          songAlbum: "Billie Eilish",
                                          isFavorite: true)]))
        album.append(Singer(name: "Seraphine",
                            image: "seraphine",
                            music: [Music(songName: "Childhood dreams",
                                          songAutor: "Seraphine",
                                          songImage: "seraphine",
                                          songAlbum: "Seraphine",
                                          isFavorite: false),
                                    Music(songName: "you make that way",
                                          songAutor: "Seraphine",
                                          songImage: "seraphine",
                                          songAlbum: "Seraphine",
                                          isFavorite: false)]))
        album.append(Singer(name: "Kai'sa",
                            image: "kaisa",
                            music: [Music(songName: "Drum go dum",
                                                          songAutor: "Kai'sa",
                                                          songImage: "kaisa",
                                                          songAlbum: "Kai'sa",
                                                          isFavorite: true),
                                                    Music(songName: "MORE",
                                                          songAutor: "KDA Feat. Seraphine",
                                                          songImage: "kda",
                                                          songAlbum: "KDA All Out",
                                                          isFavorite: true)]))
        return album
    }
    
    static func addNewSongs() -> [Music] {
        var musicArray = [Music]()
        musicArray.append(Music(songName: "Somebody That I Used to Know", songAutor: "Gotye", songImage: "gotye", songAlbum: "Making Mirrors", isFavorite: false))
        musicArray.append(Music(songName: "Childhood dreams", songAutor: "Seraphine", songImage: "seraphine", songAlbum: "Seraphine", isFavorite: false))
        musicArray.append(Music(songName: "you make that way", songAutor: "Seraphine", songImage: "seraphine", songAlbum: "Seraphine", isFavorite: false))
        musicArray.append(Music(songName: "MORE", songAutor: "KDA Feat. Seraphine", songImage: "kda", songAlbum: "KDA All Out", isFavorite: true))
        musicArray.append(Music(songName: "Bellyache", songAutor: "Billie Eilish", songImage: "billie", songAlbum: "Billie Eilish", isFavorite: true))
        musicArray.append(Music(songName: "i dont wanna be you anymore", songAutor: "Billie Eilish", songImage: "billie", songAlbum: "Billie Eilish", isFavorite: true))
        musicArray.append(Music(songName: "lovely", songAutor: "Billie Eilish", songImage: "billie", songAlbum: "Billie Eilish", isFavorite: true))
        musicArray.append(Music(songName: "Drum go dum", songAutor: "Kai'sa", songImage: "kaisa", songAlbum: "Kai'sa", isFavorite: true))
        return musicArray
    }
}

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
