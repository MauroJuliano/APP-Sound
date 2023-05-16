////
////  PlayerController.swift
////  APP-Sound
////
////  Created by Lestad on 2021-02-26.
////
//
//import Foundation
//import AVFoundation
//import UIKit
//class PlayerController {
//    var songs = ["Somebody That I Used to Know", "MORE", "Childhood dreams"]
//    var playerView: PlayerViewController?
//    var player: AVAudioPlayer?
//    var currentSong = "Somebody That I Used to Know"
//    var songsCount: Int!
//    var timer:Timer!
//    var change:CGFloat = 0.01
//    var songsArray = [Music]()
//    
//    init(playerView: PlayerViewController){
//        self.playerView = playerView
//        
//    }
//    
//    func arraySetup(){
//        if let arrayAlbum = playerView?.musicArray.filter({ $0.songAlbum == playerView?.musicSelected?.songAlbum}){
//            
//            self.songsArray.append(contentsOf: arrayAlbum)
//        }
//    }
//
//    func playSound(playingSong: Music?) {
//        player?.stop()
//
////        playerView?.playButton.setImage(UIImage(systemName: "pause"), for: .selected)
//
//        guard let url = Bundle.main.url(forResource: playingSong?.songName, withExtension: "mp3") else { return }
//   
//        do {
//            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
//            try AVAudioSession.sharedInstance().setActive(true)
//
//            /* The following line is required for the player to work on iOS 11. Change the file type accordingly*/
//            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)
//
//            /* iOS 10 and earlier require the following line:
//            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileTypeMPEGLayer3) */
//
////            guard let player = player else { return }
////            playerView?.playButton.isSelected = true
////            playerView?.playButton.setImage(UIImage(systemName: "play"), for: .normal)
////            player.play()
//                        
//        } catch let error {
//            print(error.localizedDescription)
//            
//        }
//    }
//    
//    func pausePlayer() {
////        playerView?.playButton.setImage(UIImage(systemName: "pause"), for: .selected)
////        playerView?.playButton.neumorphicLayer?.elementBackgroundColor = playerView?.view.backgroundColor?.cgColor ?? UIColor.white.cgColor
////
////        playerView?.playButton.isSelected = false
////
////        player?.pause()
////        playerView?.timer?.invalidate()
//    }
//    
//    func resumeNow(playingSong: Music?) {
////        playerView?.playButton.isSelected = true
////
////        playerView?.playButton.setImage(UIImage(systemName: "play"), for: .normal)
//            
////            if ((player?.play()) != nil) {
////                playerView?.change = 0.01
////                playerView?.timerProgressSetup()
////            }else{
////                playSound(playingSong: playingSong)
////                playerView?.change = 0.01
////                playerView?.timerProgressSetup()
////            }
//        
//        if var songDuration = player?.duration{
//            songDuration = songDuration / 60
//           
//            playerView?.durationSongLabel.text = String(format: "%.2f", songDuration)
//        }
//    }
//    
//    func progressSetup(){
//        timer = Timer.scheduledTimer(timeInterval: 0.7, target: self, selector: #selector(musicProgress), userInfo: nil,repeats: true)
//        
//    }
//    
//    func nextSong(){
//        songsCount = songsArray.count
//        if var indexOfSong = songsArray.firstIndex(where: {$0.songName == playerView?.musicSelected?.songName}) {
//            if var i = songsArray.firstIndex(where: { $0.songName == playerView?.musicSelected?.songName }) {
//                let nextSongIndex = songsArray.index(after: indexOfSong)
//                if nextSongIndex > songsCount-1 {
//                    playerView?.musicSelected = songsArray[0]
//                }else{
//                    playerView?.musicSelected = songsArray[nextSongIndex]
//                }
//                stopAndContinueSong(newSongToPlay: playerView?.musicSelected)
//            }
//        }
//    }
//    
//    func previousSong(){
//        let last = songsArray.endIndex
//        if var indexOfSong = songsArray.firstIndex(where: {$0.songName == playerView?.musicSelected?.songName}) {
//            if let i = songsArray.firstIndex(where: { $0.songName == playerView?.musicSelected?.songName }) {
//                let previousSongIndex = songsArray.index(before: indexOfSong)
//                if previousSongIndex < 0 {
//                    playerView?.musicSelected = songsArray[last-1]
//                }else{
//                    playerView?.musicSelected = songsArray[previousSongIndex]
//                }
//                stopAndContinueSong(newSongToPlay: playerView?.musicSelected)
//            }
//        }
//    }
//    
//    func stopAndContinueSong(newSongToPlay: Music?){
////        playerView?.setupUI()
////        playerView?.timer?.invalidate()
////        playSound(playingSong: newSongToPlay)
////        playerView?.timerProgressSetup()
//    }
//
//    @objc func musicProgress(){
//        let normalizedTime = Float(player?.currentTime as! Double / (player?.duration as! Double))
//       
//        if var currentTime = player?.currentTime{
//            currentTime = currentTime / 60
//           
//            playerView?.currentTimeLabel.text = String(format: "%.2f", currentTime)
//        }
//        
//    }
//}
