//
//  PlayerViewController.swift
//  APP-Sound
//
//  Created by Lestad on 2021-02-16.
//

import UIKit
import EMTNeumorphicView
import SwiftySound

class PlayerViewController: UIViewController {
    @IBOutlet var backButton: EMTNeumorphicButton!
    @IBOutlet var menuListButton: EMTNeumorphicButton!
    @IBOutlet var backwardButton: EMTNeumorphicButton!
    @IBOutlet var playButton: EMTNeumorphicButton!
    @IBOutlet var forwardButton: EMTNeumorphicButton!
    @IBOutlet var viewImage: EMTNeumorphicButton!
 
    @IBOutlet var progressBar: UIProgressView!
    @IBOutlet var autorImage: UIImageView!
    @IBOutlet var botaoimage: UIButton!
    private var songSound: Sound?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        
        // Do any additional setup after loading the view.
    }
    
    func setupUI(){
        let color2 = UIColor(rgb: 0xF0EEEF)
        self.view.backgroundColor = color2
        playButton.neumorphicLayer?.cornerRadius = 40
        playButton.neumorphicLayer?.elementBackgroundColor = view.backgroundColor?.cgColor ?? UIColor.white.cgColor
        playButton.neumorphicLayer?.edged = true
        playButton.neumorphicLayer?.borderColor = UIColor.black.cgColor
        
        backButton.neumorphicLayer?.cornerRadius = 20
       
        menuListButton.neumorphicLayer?.cornerRadius = 20
        backwardButton.neumorphicLayer?.cornerRadius = 25
        forwardButton.neumorphicLayer?.cornerRadius = 25

        autorImage.image = UIImage(named: "gotye.jpg")
        autorImage.roundCorners(.allCorners, radius: 142.5)
        viewImage.neumorphicLayer?.elementBackgroundColor = view.backgroundColor?.cgColor ?? UIColor.white.cgColor
        
        viewImage.neumorphicLayer?.cornerRadius = 150
        
    }
    func musicProgress(){
        let normalizedTime = Float(songSound?.duration as! Double / (songSound?.duration as! Double))
        self.progressBar.progress = normalizedTime
    }
    @IBAction func playButton(_ sender: Any) {
        playButton.setImage(UIImage(systemName: "pause"), for: .selected)
        
        if playButton.isSelected == true {
            
            playButton.setImage(UIImage(systemName: "pause"), for: .selected)
            playButton.neumorphicLayer?.elementBackgroundColor = view.backgroundColor?.cgColor ?? UIColor.white.cgColor
            playButton.isSelected = false
            songSound?.pause()
            
        }else{
           
            if songSound?.paused == true {
                songSound?.resume()
                
            }else {
                if let soundUrl = Bundle.main.url(forResource: "Somebody That I Used to Know", withExtension: "mp3") {
                    
                    songSound = Sound(url: soundUrl)
                    songSound?.play()
                    musicProgress()
                    playButton.isSelected = true
                    playButton.setImage(UIImage(systemName: "play"), for: .normal)
                }
            }
            playButton.neumorphicLayer?.shadowOpacity = 0
            playButton.isSelected = true
        }
    }
    
}
extension UIView {
    
    func roundCorners(_ corners: UIRectCorner, radius: CGFloat) {
         let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
         let mask = CAShapeLayer()
         mask.path = path.cgPath
         self.layer.mask = mask
    }
}
