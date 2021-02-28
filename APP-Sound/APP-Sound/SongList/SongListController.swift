//
//  SongListController.swift
//  APP-Sound
//
//  Created by Lestad on 2021-02-28.
//

import Foundation
import UIKit
import AVFoundation
class SongListController: NSObject, UITableViewDelegate, UITableViewDataSource {
    var player: AVAudioPlayer?
    var view: SongListViewController?
    var songsArray = [Music]()
    
    init(view: SongListViewController) {
        self.view = view
        print(player?.isPlaying)
    }
    
    func arraySetup(){
        if let arrayAlbum = view?.musicArray.filter({ $0.songAlbum == view?.albumSelected?.songAlbum}){
            
            self.songsArray.append(contentsOf: arrayAlbum)
            
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return songsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SongList", for: indexPath) as! SongListTableViewCell
        let array = songsArray[indexPath.row]
        cell.setup(music: array)
        cell.buttonTap = {
            
            if let currentSong = array.songName {
                cell.playButton.setImage(UIImage(systemName: "pause"), for: .selected)
                cell.playButton.setImage(UIImage(systemName: "play"), for: .normal)
                if cell.playButton.isSelected == false {
                    let resume = try? self.resumeNow(currentSong: currentSong)
                    cell.playButton.isSelected = true
                }else{
                    self.pausePlayer()
                    cell.playButton.isSelected = false
                }
            }
        }
        return cell
    }
    func playSound(currentSong: String){
        
        player?.stop()

        guard let url = Bundle.main.url(forResource: currentSong, withExtension: "mp3") else { return }
   
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)

            /* The following line is required for the player to work on iOS 11. Change the file type accordingly*/
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)

            /* iOS 10 and earlier require the following line:
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileTypeMPEGLayer3) */

            guard let player = player else { return }

            player.play()
           
            
        } catch let error {
            print(error.localizedDescription)
            
        }
    }
    
    func pausePlayer() {
        player?.pause()

    }
        func resumeNow(currentSong: String) {

            if ((player?.play()) != nil) {
            }else{
                playSound(currentSong: currentSong)
            }
    }
 
}
