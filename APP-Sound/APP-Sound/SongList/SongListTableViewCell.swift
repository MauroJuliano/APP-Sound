//
//  SongListTableViewCell.swift
//  APP-Sound
//
//  Created by Lestad on 2021-02-28.
//

import UIKit
import EMTNeumorphicView

class SongListTableViewCell: UITableViewCell {
    @IBOutlet var songNameLabel: UILabel!
    @IBOutlet var songAutorLabel: UILabel!
    @IBOutlet var playButton: EMTNeumorphicButton!
    @IBOutlet var viewCell: EMTNeumorphicButton!
    
    var buttonTap : (() -> ()) = {}
    let color2 = UIColor(rgb: 0xF0EEEF)
    
    override func awakeFromNib() {
        super.awakeFromNib()
        contentView.backgroundColor = color2
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBAction func playSongButton(_ sender: Any) {
        buttonTap()
        
    }
    func setup(music: Music){
        songNameLabel.text = music.songName
        songAutorLabel.text = music.songAutor
    
        playButton.neumorphicLayer?.cornerRadius = 20
        playButton.neumorphicLayer?.elementBackgroundColor = contentView.backgroundColor?.cgColor ?? UIColor.white.cgColor
        playButton.neumorphicLayer?.edged = true
        playButton.neumorphicLayer?.borderColor = UIColor.black.cgColor
        
        viewCell.neumorphicLayer?.elementBackgroundColor = contentView.backgroundColor?.cgColor ?? UIColor.white.cgColor
        //viewCell.neumorphicLayer?.cornerRadius = 24
          // set convex or concave.
        viewCell.neumorphicLayer?.depthType = .concave
          // set elementDepth (corresponds to shadowRadius). Default is 5
        viewCell.neumorphicLayer?.elementDepth = 7
        
        
        
    }
    

}
