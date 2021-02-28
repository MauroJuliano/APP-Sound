//
//  PlayListsCollectionViewCell.swift
//  APP-Sound
//
//  Created by Lestad on 2021-02-28.
//

import UIKit
import EMTNeumorphicView
class PlayListsCollectionViewCell: UICollectionViewCell {
    @IBOutlet var backView: EMTNeumorphicButton!
    @IBOutlet var iconView: EMTNeumorphicButton!
    @IBOutlet var iconImage: UIImageView!
    @IBOutlet var albumNameLabel: UILabel!
    
    let color2 = UIColor(rgb: 0xF0EEEF)
    
    func setup(music: Music){
        //contentView.backgroundColor = color2
        albumNameLabel.text = music.songAlbum
        
        backView.neumorphicLayer?.cornerRadius = 20
        backView.neumorphicLayer?.elementBackgroundColor = color2.cgColor ?? UIColor.white.cgColor
        backView.neumorphicLayer?.edged = true
        backView.neumorphicLayer?.depthType = .concave
        backView.neumorphicLayer?.borderColor = UIColor.black.cgColor
        
        iconView.neumorphicLayer?.elementBackgroundColor = color2.cgColor  ?? UIColor.white.cgColor
        iconView.neumorphicLayer?.cornerRadius = 20
        
        iconView.neumorphicLayer?.elementDepth = 7
    }
}
