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
    @IBOutlet var currentTimeLabel: UILabel!
    @IBOutlet var durationSongLabel: UILabel!
    var change:CGFloat = 0.01
    @IBOutlet var songNameLabel: UILabel!
    @IBOutlet var artistNameLabel: UILabel!
    @IBOutlet var progressBar: UIProgressView!
    @IBOutlet var autorImage: UIImageView!
    @IBOutlet var botaoimage: UIButton!
    private var songSound: Sound?
    var musicSelected: Music?
    var musicArray = [Music]()
    var controller: PlayerController?
    var musicController = NewSong()
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
    
    override func viewWillAppear(_ animated: Bool) {
        getSongs()
    }
    
    func getSongs(){
        musicController.addNewSongs(completionHandler: { success, _ in
            if success{
                self.musicArray = self.musicController.musicArray
                self.controller?.arraySetup()
            }
        })
    }
    @objc internal func refreshAudioView(_:Timer) {
        
        if self.siriProgressView.amplitude <= self.siriProgressView.idleAmplitude || self.siriProgressView.amplitude > 1.0 {
            self.change *= -1.0
        }
        // Simply set the amplitude to whatever you need and the view will update itself.
        self.siriProgressView.amplitude += self.change
    }
    
    @IBAction func backButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
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
        
        if let musicInfo = musicSelected {
            autorImage.image = UIImage(named: musicInfo.songImage)!
            autorImage.roundCorners(.allCorners, radius: 142.5)
            viewImage.neumorphicLayer?.elementBackgroundColor = view.backgroundColor?.cgColor ?? UIColor.white.cgColor
            
            viewImage.neumorphicLayer?.cornerRadius = 150
            songNameLabel.text = musicInfo.songName
            artistNameLabel.text = musicInfo.songAutor
        }
        
    }
    
    
    @IBAction func playButton(_ sender: Any) {
        playButton.setImage(UIImage(systemName: "pause"), for: .selected)
        
        if playButton.isSelected == false {
            let resume = try? controller?.resumeNow(playingSong: musicSelected)
        }else {
            controller?.pausePlayer()
        }
        controller?.progressSetup()
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
