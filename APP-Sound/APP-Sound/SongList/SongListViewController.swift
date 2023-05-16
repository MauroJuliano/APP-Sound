import EMTNeumorphicView
import UIKit

protocol SongListDisplaying: AnyObject {
    func displayScreen(singer: String)
}

final class SongListViewController: UIViewController {
    var lists = [SongListView]()
    var songName: String?
    var songImage: String?
    var musicArray: [Singer]?
    
    private var interactor: SongListInteracting
    
    var musicController = NewSong()
    
    private lazy var customView: SongOptionView = {
        let view = SongOptionView()
        view.backAction = { [weak self] in
          self?.backAction()
        }
        return view
    }()
    
    init(interactor: SongListInteracting) {
        self.interactor = interactor
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        self.view = customView
        interactor.loadData()
    }
    
    func setupUI(singer: String) {
        musicArray = Songs.getMusics()
        guard let album = musicArray?.filter({ $0.name == singer }) else { return }
        let illustration = album.first?.image ?? ""
        
        album.forEach { album in
            album.music.forEach { songs in
                let list = SongListView(title: songs.songName, subtitle: songs.songAlbum)
                
                list.playAction = {
                    guard !list.playButton.isSelected else {
                        list.playButton.isSelected = false
                        self.interactor.pauseSong()
                        return
                    }
                    
                    self.interactor.playSong(currentSong: songs.songName)
                    list.playButton.isSelected = true
                }
                
                list.contentAction = { [weak self] in
                    self?.interactor.openPlayer(singer: album.name,
                                                illustration: illustration,
                                                songName: songs.songName)
                    //self?.songListModel.nextView(music: songs)
                }
                lists.append(list)
            }
        }
        
        customView.setupUI(title: singer,
                           Illustration: illustration,
                           songList: lists)
        
    }
    
    func backAction() {
        self.dismiss(animated: true, completion: nil)
    }
}

extension SongListViewController: SongListDisplaying {
    func displayScreen(singer: String) {
        setupUI(singer: singer)
    }
}
