import UIKit
import EMTNeumorphicView
import AVFoundation

protocol MusicDelegate: AnyObject {
    func updateMusic(currentSinger: Int, currentSong: Int)
}

protocol MainViewDisplaying: AnyObject {
    var musics: [Singer] {get set}
    func displayScreen(musicInfo: Music)
    func playButton(isSelected: Bool)
    func updateMusic(currentSinger: Int, currentSong: Int)
}

final class MainViewController: UIViewController {
    var musics = [Singer]()
    
    private var interactor: MainViewInterating
    
    private lazy var customView: MainView = {
        let view = MainView()
        view.action = { [weak self] in
            self?.interactor.loadSongs()
        }
        return view
    }()
    
    
    init(interactor: MainViewInterating) {
        self.interactor = interactor
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        self.view = customView
        interactor.loadSongs()
    }
}

extension MainViewController: MainViewDisplaying {
    func displayScreen(musicInfo: Music) {
        customView.collectionView.delegate = self
        customView.collectionView.dataSource = self
        
        customView.setupView(musics: musics.count)
        customView.currentSong(title: musicInfo.songName,
                               subTitle: musicInfo.songAutor,
                               illustration: musicInfo.songImage)
        
        customView.floatingAction = { [weak self] in
            let isSelected = self?.customView.musicSheet.playButton.isSelected ?? false
            
            if isSelected {
                self?.interactor.pauseSong()
            } else {
                self?.interactor.playSong()
            }
        }
    }
    
    func playButton(isSelected: Bool) {
        customView.musicSheet.playButton.isSelected = isSelected
    }
    
    func updateMusic(currentSinger: Int, currentSong: Int) {
        print(currentSong, currentSinger)
    }
}

extension MainViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        return CGSize(width: 300.0, height: 300.0)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.interactor.openSongList(singer: musics[indexPath.row].name)
//        if let storyboard = UIStoryboard(name: "SongList", bundle: nil).instantiateInitialViewController() as? SongListViewController {
//            storyboard.songName = musics[indexPath.row].name
//            storyboard.songImage = musics[indexPath.row].image
//            storyboard.modalPresentationStyle = .fullScreen
          //  present(storyboard, animated: true, completion: nil)
     //  }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return musics.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PlayListCell", for: indexPath) as? PlayListsCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.setup(music: musics[indexPath.row])
        return cell
    }
}
