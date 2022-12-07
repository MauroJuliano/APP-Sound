import EMTNeumorphicView
import UIKit

class SongListViewController: UIViewController {
    @IBOutlet var albumImageView: UIImageView!
    @IBOutlet var AlbumImageButton: EMTNeumorphicButton!
    @IBOutlet var albumTitleLabel: UILabel!
    @IBOutlet var songListTable: UITableView!
    @IBOutlet var albumView: UIView!
    @IBOutlet var backButton: EMTNeumorphicButton!
    var albumSelected: Music?
    var musicArray: [Music]?
    let color2 = UIColor(RGB: 0xF0EEEF)
    var controller: SongListController?
    var musicController = NewSong()
    
    let customView = SongOptionView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = customView
//        setupUI()
//        tableViewSetup()
        getSongs()
        // Do any additional setup after loading the view.
    }
    
    func getSongs(){
        musicController.addNewSongs(completionHandler: { success, _ in
            if success {
                self.musicArray = self.musicController.musicArray
                self.setupArray()
            }
        })
    }
    
    func setupArray() {
        guard let album = musicArray?.filter({ $0.songAlbum == albumSelected?.songAlbum}) else { return }
        
        if let name = album.first?.songName, let illustration = album.first?.songImage {
            customView.setupUI(title: name, Illustration: illustration, songList: album)
        }
    }
        
    func setupUI(){
        self.view.backgroundColor = color2
        albumTitleLabel.text = albumSelected?.songAlbum
        albumImageView.image = UIImage(named: (albumSelected?.songImage)!)
        albumImageView.roundCorners(.allCorners, radius: 82.5)
        
        AlbumImageButton.neumorphicLayer?.elementBackgroundColor = view.backgroundColor?.cgColor ?? UIColor.white.cgColor
        AlbumImageButton.neumorphicLayer?.cornerRadius = 90
        
        albumView.backgroundColor = color2
        
       
        
        backButton.neumorphicLayer?.elementBackgroundColor = view.backgroundColor?.cgColor ?? UIColor.white.cgColor
        backButton.backgroundColor = color2
        backButton.neumorphicLayer?.cornerRadius = 20
        
    }
    @IBAction func backButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func tableViewSetup(){
        controller = SongListController(view: self)
        songListTable.backgroundColor = color2
        songListTable.delegate = controller
        songListTable.dataSource = controller
        songListTable.reloadData()
    }
    
}
