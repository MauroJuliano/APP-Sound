//
//  SongListViewController.swift
//  APP-Sound
//
//  Created by Lestad on 2021-02-28.
//

import UIKit
import EMTNeumorphicView
class SongListViewController: UIViewController {
    @IBOutlet var albumImageView: UIImageView!
    @IBOutlet var AlbumImageButton: EMTNeumorphicButton!
    @IBOutlet var albumTitleLabel: UILabel!
    @IBOutlet var songListTable: UITableView!
    @IBOutlet var albumView: UIView!
    
    var musicArray = [Music]()
    let color2 = UIColor(rgb: 0xF0EEEF)
    var controller: SongListController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        tableViewSetup()
        addSongs()
        // Do any additional setup after loading the view.
    }
    
    func addSongs(){
        musicArray.append(Music(songName: "Somebody That I Used To Know", songAutor: "Gotye", songImage: "Gotye", songAlbum: "Making Mirrors", isFavorite: false))
        musicArray.append(Music(songName: "ChildHood Dreams", songAutor: "Seraphine", songImage: "Gotye", songAlbum: "Seraphine", isFavorite: false))
        musicArray.append(Music(songName: "you make that way", songAutor: "Seraphine", songImage: "Gotye", songAlbum: "Seraphine", isFavorite: false))
        musicArray.append(Music(songName: "MORE", songAutor: "KDA Feat. Seraphine", songImage: "Gotye", songAlbum: "KDA All Out", isFavorite: false))
        controller?.arraySetup()
        
    }
        
    func setupUI(){
        self.view.backgroundColor = color2
        albumImageView.image = UIImage(named: "gotye.jpg")
        albumImageView.roundCorners(.allCorners, radius: 82.5)
        AlbumImageButton.neumorphicLayer?.elementBackgroundColor = view.backgroundColor?.cgColor ?? UIColor.white.cgColor
        albumView.backgroundColor = color2
        AlbumImageButton.neumorphicLayer?.cornerRadius = 90
        
    }
    
    func tableViewSetup(){
        controller = SongListController(view: self)
        songListTable.backgroundColor = color2
        songListTable.delegate = controller
        songListTable.dataSource = controller
        songListTable.reloadData()
    }
    
}
