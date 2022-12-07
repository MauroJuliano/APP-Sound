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
    var song = ""
    init(view: SongListViewController) {
        self.view = view
    }
    
//    func arraySetup(){
//        if let arrayAlbum = view?.musicArray.filter({ $0.songAlbum == view?.albumSelected?.songAlbum}){
//            
//            self.songsArray.append(contentsOf: arrayAlbum)
//            
//        }
//    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return songsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SongList", for: indexPath) as! SongListTableViewCell
        let array = songsArray[indexPath.row]
        cell.setup(music: array)
            
        cell.cellTap = {
            self.nextView(music: array)
        }
        cell.buttonTap = {
            
                cell.playButton.setImage(UIImage(systemName: "pause"), for: .selected)
                cell.playButton.setImage(UIImage(systemName: "play"), for: .normal)
                
                if cell.playButton.isSelected == false {
                    let resume = try? self.resumeNow(currentSong: array.songName)
                    //self.playSound(currentSong: currentSong)
                    self.song = array.songName
                    cell.playButton.isSelected = true
                    
                }else{
                    self.pausePlayer()
                    cell.playButton.isSelected = false
                }
        }
        
        return cell
    }
    func nextView(music: Music?){
        if let storyboard = UIStoryboard(name: "Player", bundle: nil).instantiateInitialViewController() as? PlayerViewController {
            storyboard.modalPresentationStyle = .fullScreen
            storyboard.musicSelected = music
            player?.stop()
            view!.present(storyboard, animated: true, completion: nil)
        }
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
            print(currentSong, "song before", song)
            if currentSong != song {
                playSound(currentSong: currentSong)
            }else if ((player?.play()) != nil) {
            }else{
                playSound(currentSong: currentSong)
            }
    }
 
}
