//
//  PlayerController.swift
//  APP-Sound
//
//  Created by Lestad on 2021-02-26.
//

import Foundation
import AVFoundation
import UIKit
class PlayerController {
    var songs = ["Somebody That I Used to Know", "MORE", "Childhood dreams"]
    var playerView: PlayerViewController?
    var player: AVAudioPlayer?
    var currentSong = "Somebody That I Used to Know"
    var songsCount: Int!
    var timer:Timer!
    init(playerView: PlayerViewController){
        self.playerView = playerView
      
    }

    func playSound() {
        player?.stop()

        playerView?.playButton.setImage(UIImage(systemName: "pause"), for: .selected)

        guard let url = Bundle.main.url(forResource: currentSong, withExtension: "mp3") else { return }
   
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)

            /* The following line is required for the player to work on iOS 11. Change the file type accordingly*/
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)

            /* iOS 10 and earlier require the following line:
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileTypeMPEGLayer3) */

            guard let player = player else { return }
            playerView?.playButton.isSelected = true
            playerView?.playButton.setImage(UIImage(systemName: "play"), for: .normal)
            player.play()
            
            
        } catch let error {
            print(error.localizedDescription)
            
        }
    }
    
    func pausePlayer() {
        playerView?.playButton.setImage(UIImage(systemName: "pause"), for: .selected)
        playerView?.playButton.neumorphicLayer?.elementBackgroundColor = playerView?.view.backgroundColor?.cgColor ?? UIColor.white.cgColor
        
        playerView?.playButton.isSelected = false
        
        player?.pause()
    }

        func resumeNow() {
        playerView?.playButton.isSelected = true
        playerView?.playButton.setImage(UIImage(systemName: "play"), for: .normal)
            if ((player?.play()) != nil) {
                progressSetup()
            }else{
             playSound()
                progressSetup()
            }
    }
    func progressSetup(){
        timer = Timer.scheduledTimer(timeInterval: 0.3, target: self, selector: #selector(musicProgress), userInfo: nil,repeats: true)
        musicProgress()
    }
    func nextSong(){
        songsCount = songs.count
        if var indexOfSong = songs.firstIndex(where: {$0 == currentSong}) {
            if var i = songs.firstIndex(where: { $0 == currentSong }) {
                let nextSongIndex = songs.index(after: indexOfSong)
                
                if nextSongIndex > songsCount-1 {
                    currentSong = songs[0]
                }else{
                currentSong = songs[nextSongIndex]
                }
                playSound()
                
            }
        }
    }
    
    func previousSong(){
        let last = songs.endIndex
        print(last)
        if var indexOfSong = songs.firstIndex(where: {$0 == currentSong}) {
            if let i = songs.firstIndex(where: { $0 == currentSong }) {
                let previousSongIndex = songs.index(before: indexOfSong)
                if previousSongIndex < 0 {
                   print(0, previousSongIndex)
                    currentSong = songs[2]
                }else{
                currentSong = songs[previousSongIndex]
                }
                playSound()
                
            }
        }
    }
    
    @objc func musicProgress(){
        let normalizedTime = Float(player?.currentTime as! Double / (player?.duration as! Double))
        playerView?.progressBar.progress = normalizedTime
    }
}
