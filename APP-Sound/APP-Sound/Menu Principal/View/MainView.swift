import AVFoundation
import EMTNeumorphicView
import SnapKit
import UIKit

class MainView: UIView {
    private lazy var titleLabel: UILabel = {
        var label = UILabel()
        label.textAlignment = .left
        label.font = UIFont(name: "Lobster Two", size: 30)
        return label
    }()
    
    private lazy var subtitleLabel: UILabel = {
        var label = UILabel()
        label.textAlignment = .left
        label.font = UIFont(name: "Lobster Two", size: 20)
        return label
    }()
    
    private lazy var favoriteView: EMTNeumorphicButton = {
        var button = EMTNeumorphicButton()
        button.neumorphicLayer?.cornerRadius = 20
        button.neumorphicLayer?.elementBackgroundColor = NeumorphicColor.base01.color.cgColor
        button.neumorphicLayer?.edged = true
        button.neumorphicLayer?.depthType = .convex
        button.neumorphicLayer?.borderColor = UIColor.black.cgColor
        button.addTarget(self, action: #selector(pressedAction), for: .touchUpInside)
        return button
    }()
    
    private lazy var favoritesIcon: EMTNeumorphicButton = {
        var button = EMTNeumorphicButton()
        button.contentMode = .scaleAspectFit
        button.neumorphicLayer?.cornerRadius = 20
        button.neumorphicLayer?.elementBackgroundColor = NeumorphicColor.base01.color.cgColor
        button.neumorphicLayer?.elementDepth = 7
        button.tintColor = .systemIndigo
        return button
    }()
    
    private lazy var favoriteLabel: UILabel = {
        var label = UILabel()
        label.font = UIFont(name: "Lobster Two", size: 20)
        return label
    }()
    
    private lazy var songsIndicatorLabel: UILabel = {
        var label = UILabel()
        label.numberOfLines = 2
        label.textAlignment = .center
        return label
    }()
    
    private lazy var recommendedLabel: UILabel = {
        var label = UILabel()
        label.textAlignment = .left
        label.font = UIFont(name: "Lobster Two", size: 25)
        return label
    }()
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 205, height: 205)
        layout.scrollDirection = .horizontal
        var view = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        view.register(PlayListsCollectionViewCell.self, forCellWithReuseIdentifier: "PlayListCell")
        view.showsHorizontalScrollIndicator = false
        view.backgroundColor = .clear
        return view
    }()
   
    lazy var musicSheet: MusicSheet = {
        let view = MusicSheet()
        view.playAction = {
            self.playFloatingAction()
            self.isMusicSheetSelected = true
        }
        return view
    }()
     
    var isMusicSheetSelected: Bool = false
    var action: () -> Void = { /* Intentionally unimplemented */ }
    var floatingAction: () -> Void = { /* Intentionally unimplemented */ }
    
    init() {
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func currentSong(title: String, subTitle: String, illustration: String) {
        musicSheet.setup(title: title, subtitle: subTitle, illustration: illustration)
    }
    
    func setupView(musics: Int) {
        titleLabel.text = "Playlist"
        subtitleLabel.text = ""
        favoriteLabel.text = "Favorites"
        favoritesIcon.setImage(UIImage(systemName: "guitars.fill"), for: .normal)
        songsIndicatorLabel.text = "\(musics)\n Songs"
        recommendedLabel.text = "Recommended"
        self.backgroundColor = UIColor(RGB: 0xF0EEEF)
        buildHierarchy()
        setupContraints()
    }
    
    func buildHierarchy() {
        favoriteView.addSubview(favoritesIcon)
        favoriteView.addSubview(favoriteLabel)
        favoriteView.addSubview(songsIndicatorLabel)
        
        addSubview(titleLabel)
        addSubview(subtitleLabel)
        addSubview(favoriteView)
        addSubview(recommendedLabel)
        addSubview(collectionView)
        addSubview(musicSheet)
    }
    
    func playFloatingAction() {
        floatingAction()
    }
    @objc
    func pressedAction(){
        action()
    }
    
    func setupContraints() {
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(Space.base12.rawValue)
            $0.leading.equalToSuperview().inset(Space.base08.rawValue)
        }
        
        subtitleLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(Space.base05.rawValue)
            $0.leading.equalToSuperview().offset(Space.base08.rawValue)
        }
        
        favoriteView.snp.makeConstraints {
            $0.top.equalTo(subtitleLabel.snp.bottom).offset(Space.base07.rawValue)
            $0.leading.equalToSuperview().offset(Space.base07.rawValue)
            $0.trailing.equalToSuperview().offset(-Space.base07.rawValue)
            $0.height.equalTo(190)
        }
        
        favoritesIcon.snp.makeConstraints {
            $0.top.leading.equalToSuperview().offset(Space.base05.rawValue)
            $0.width.height.equalTo(40)
        }
        
        favoriteLabel.snp.makeConstraints {
            $0.top.equalTo(favoritesIcon.snp.bottom).offset(Space.base09.rawValue)
            $0.leading.equalTo(favoriteView.snp.leading).offset(Space.base05.rawValue)
        }
        
        songsIndicatorLabel.snp.makeConstraints {
            $0.trailing.equalToSuperview().offset(-Space.base05.rawValue)
            $0.bottom.equalToSuperview().offset(-Space.base07.rawValue)
        }
        
        recommendedLabel.snp.makeConstraints {
            $0.top.equalTo(favoriteView.snp.bottom).offset(Space.base07.rawValue)
            $0.leading.equalToSuperview().offset(Space.base08.rawValue)
        }
        
        collectionView.snp.makeConstraints {
            $0.top.equalTo(recommendedLabel.snp.bottom).offset(Space.base07.rawValue)
            $0.leading.equalToSuperview().offset(Space.base07.rawValue)
            $0.trailing.equalToSuperview().offset(Space.none.rawValue)
        }
        
        musicSheet.snp.makeConstraints {
            $0.top.equalTo(collectionView.snp.bottom).offset(Space.base04.rawValue)
            $0.leading.trailing.equalToSuperview().inset(Space.base04.rawValue)
            $0.bottom.equalToSuperview()
            $0.height.equalTo(100)
        }
    }
}
