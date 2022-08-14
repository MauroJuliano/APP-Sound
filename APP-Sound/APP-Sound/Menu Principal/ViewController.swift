import UIKit
import EMTNeumorphicView
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet var playlistCollectionview: UICollectionView!
    @IBOutlet var favoritesView: EMTNeumorphicButton!
    @IBOutlet var iconView: EMTNeumorphicButton!
    @IBOutlet var favoritesLabel: UILabel!
    
    var customView = MainView()
    
    var player: AVAudioPlayer?
    var musicArray = [Music]()
    var controller: PlayListController?
    var musicController = NewSong()
    
    // TODO: Change color to another file
    let color2 = UIColor(rgb: 0xF0EEEF)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionSetup()
        setup()
        getSongs()
         view.backgroundColor = color2
        
       self.view = customView
    }
    
    func getSongs(){
        controller = PlayListController(view: self)
        musicController.addNewSongs(completionHandler: { success, _ in
            if success {
                self.musicArray.append(contentsOf: self.musicController.musicArray)
                
                if self.musicArray != nil {
                    self.controller?.arraySetup(completionHandler: { success in
                       if success {
                        self.controller?.getFavorites()
                        //self.favoritesLabel.text = "\(self.musicArray.count)"
                        self.collectionSetup()
                        
                    }})
                }
            }
        })
    }
    
    func setup(){
        favoritesLabel.text = "\(musicArray.count)"
        favoritesView.neumorphicLayer?.cornerRadius = 20
        favoritesView.neumorphicLayer?.elementBackgroundColor = color2.cgColor ?? UIColor.white.cgColor
        favoritesView.neumorphicLayer?.edged = true
        favoritesView.neumorphicLayer?.depthType = .convex
        favoritesView.neumorphicLayer?.borderColor = UIColor.black.cgColor
        
        iconView.neumorphicLayer?.elementBackgroundColor = color2.cgColor  ?? UIColor.white.cgColor
        iconView.neumorphicLayer?.cornerRadius = 20
        iconView.neumorphicLayer?.elementDepth = 7
    }
    
    func collectionSetup(){
       // controller = PlayListController(view: self)
        playlistCollectionview.delegate = controller
        playlistCollectionview.dataSource = controller
        playlistCollectionview.reloadData()
        
        customView.collectionView.delegate = controller
        customView.collectionView.dataSource = controller
        customView.collectionView.reloadData()
    }
}

