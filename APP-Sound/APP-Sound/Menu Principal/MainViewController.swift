import UIKit
import EMTNeumorphicView
import AVFoundation

class MainViewController: UIViewController {
    private var customView = MainView()
    private var albumMusic = [Music]()
    
    var player: AVAudioPlayer?
    var musicArray = [Music]()
    lazy var controller = MainViewPresenter(view: self)
    var musicController = NewSong()
    
    override func loadView() {
        controller.getSongs()
        self.view = customView
    }
    
    func displayScreen(viewModel: [Music]) {
        albumMusic.append(contentsOf: viewModel)
        customView.collectionView.delegate = self
        customView.collectionView.dataSource = self
        customView.collectionView.reloadData()
        
        customView.setupView(musics: viewModel.count)
    }
}

extension MainViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        return CGSize(width: 300.0, height: 300.0)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let storyboard = UIStoryboard(name: "SongList", bundle: nil).instantiateInitialViewController() as? SongListViewController {
            storyboard.albumSelected = albumMusic[indexPath.row]
            storyboard.modalPresentationStyle = .fullScreen
            present(storyboard, animated: true, completion: nil)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return albumMusic.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PlayListCell", for: indexPath) as? PlayListsCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.setup(music: albumMusic[indexPath.row])
        return cell
    }
}
