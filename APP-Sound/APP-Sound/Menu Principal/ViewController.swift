//
//  ViewController.swift
//  APP-Sound
//
//  Created by Lestad on 2021-02-16.
//

import UIKit
import EMTNeumorphicView
import AVFoundation
class ViewController: UIViewController {

    @IBOutlet var playlistCollectionview: UICollectionView!
    @IBOutlet var favoritesView: EMTNeumorphicButton!
    @IBOutlet var iconView: EMTNeumorphicButton!
    @IBOutlet var favoritesLabel: UILabel!
    var player: AVAudioPlayer?
    var musicArray = [Music]()
    var controller: PlayListController?
    var musicController = NewSong()
    var teste = "teste1"
    let color2 = UIColor(rgb: 0xF0EEEF)
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionSetup()
        setup()
        getSongs()
        view.backgroundColor = color2

    }
    override func viewWillAppear(_ animated: Bool) {
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
    }
}
extension UIColor {
   convenience init(red: Int, green: Int, blue: Int) {
       assert(red >= 0 && red <= 255, "Invalid red component")
       assert(green >= 0 && green <= 255, "Invalid green component")
       assert(blue >= 0 && blue <= 255, "Invalid blue component")

       self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
   }

   convenience init(rgb: Int) {
       self.init(
           red: (rgb >> 16) & 0xFF,
           green: (rgb >> 8) & 0xFF,
           blue: rgb & 0xFF
       )
   }
}

