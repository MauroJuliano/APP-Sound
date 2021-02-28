//
//  PlayerViewController.swift
//  APP-Sound
//
//  Created by Lestad on 2021-02-16.
//

import UIKit
import EMTNeumorphicView
import SwiftySound
import SwiftSiriWaveformView
class PlayerViewController: UIViewController {
    @IBOutlet var backButton: EMTNeumorphicButton!
    @IBOutlet var menuListButton: EMTNeumorphicButton!
    @IBOutlet var backwardButton: EMTNeumorphicButton!
    @IBOutlet var playButton: EMTNeumorphicButton!
    @IBOutlet var forwardButton: EMTNeumorphicButton!
    @IBOutlet var viewImage: EMTNeumorphicButton!
    @IBOutlet weak var siriProgressView: SwiftSiriWaveformView!
    var timer:Timer?
    var change:CGFloat = 0.01
    @IBOutlet var progressBar: UIProgressView!
    @IBOutlet var autorImage: UIImageView!
    @IBOutlet var botaoimage: UIButton!
    private var songSound: Sound?
    var controller: PlayerController?
    let color2 = UIColor(rgb: 0xF0EEEF)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        siriProgressView.backgroundColor = color2
        self.controller = PlayerController(playerView: self)
        
    }
    func timerProgressSetup(){
        
        timer = Timer.scheduledTimer(timeInterval: 0.03, target: self, selector: #selector(refreshAudioView(_:)), userInfo: nil, repeats: true)
    }
    
    @objc internal func refreshAudioView(_:Timer) {
        
        if self.siriProgressView.amplitude <= self.siriProgressView.idleAmplitude || self.siriProgressView.amplitude > 1.0 {
            self.change *= -1.0
        }
        // Simply set the amplitude to whatever you need and the view will update itself.
        self.siriProgressView.amplitude += self.change
    }
    
    func setupUI(){
        //let color2 = UIColor(rgb: 0xF0EEEF)
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
    
    
    @IBAction func playButton(_ sender: Any) {
        playButton.setImage(UIImage(systemName: "pause"), for: .selected)
        
        if playButton.isSelected == false {
             let resume = try? controller?.resumeNow()
        }else {
            controller?.pausePlayer()
        }
    }
    @IBAction func previousSongButton(_ sender: Any) {
        controller?.previousSong()
    }
    @IBAction func nextSongButton(_ sender: Any) {
        controller?.nextSong()
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
