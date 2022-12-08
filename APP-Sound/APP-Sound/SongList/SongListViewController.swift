import EMTNeumorphicView
import UIKit

final class SongListViewController: UIViewController {
    var lists = [SongListView]()
    var albumSelected: Music?
    var musicArray: [Music]?
    private lazy var songListModel = SongListViewModel(view: self)
    var musicController = NewSong()
    
    private lazy var customView: SongOptionView = {
        let view = SongOptionView()
        view.backAction = { [weak self] in
          self?.backAction()
        }
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = customView
        getSongs()
    }
    
    func getSongs(){
        musicController.addNewSongs(completionHandler: { success, _ in
            if success {
                self.musicArray = self.musicController.musicArray
                self.setupUI()
            }
        })
    }
        
    func setupUI() {
        guard let album = musicArray?.filter({ $0.songAlbum == albumSelected?.songAlbum}) else { return }
        
        if let name = album.first?.songAutor,
           let illustration = album.first?.songImage {
            
            album.forEach { songs in
                let list = SongListView(title: songs.songName, subtitle: songs.songAlbum)
                
                list.playAction = {
                    guard !list.playButton.isSelected else {
                        list.playButton.isSelected = false
                        self.songListModel.pausePlayer()
                        return
                    }
                    
                    self.songListModel.resumeNow(currentSong: songs.songName)
                    self.songListModel.song = songs.songName
                    list.playButton.isSelected = true
                }
                
                list.contentAction = { [weak self] in
                    self?.songListModel.nextView(music: songs)
                }
                
                lists.append(list)
            }
            
            customView.setupUI(title: name, Illustration: illustration, songList: lists)
        }
        
    }
    
    func backAction() {
        self.dismiss(animated: true, completion: nil)
    }
}
