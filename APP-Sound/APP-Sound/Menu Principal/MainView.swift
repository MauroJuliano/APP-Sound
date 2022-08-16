import UIKit
import EMTNeumorphicView
import AVFoundation

class MainView: UIView {
    private lazy var titleLabel: UILabel = {
        var label = UILabel()
        label.textAlignment = .left
        label.font = UIFont(name: "Noto Sans Oriya", size: 30)
        return label
    }()
    
    private lazy var subtitleLabel: UILabel = {
        var label = UILabel()
        label.textAlignment = .left
        label.font = UIFont(name: "Noto Sans Oriya", size: 20)
        return label
    }()
    
    private lazy var favoriteView: EMTNeumorphicButton = {
        var button = EMTNeumorphicButton()
        button.neumorphicLayer?.cornerRadius = 20
        button.neumorphicLayer?.elementBackgroundColor = NeumorphicColor.base01.color.cgColor
        button.neumorphicLayer?.edged = true
        button.neumorphicLayer?.depthType = .convex
        button.neumorphicLayer?.borderColor = UIColor.black.cgColor
        return button
    }()
    
    private lazy var favoritesIcon: EMTNeumorphicButton = {
        var button = EMTNeumorphicButton()
        button.contentMode = .scaleAspectFit
        button.neumorphicLayer?.cornerRadius = 20
        button.neumorphicLayer?.elementBackgroundColor = NeumorphicColor.base01.color.cgColor
        button.neumorphicLayer?.elementDepth = 7
        return button
    }()
    
    private lazy var favoriteLabel: UILabel = {
        var label = UILabel()
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
        label.font = UIFont(name: "Noto Sans Oriya", size: 20)
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
   
    init() {
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView(musics: Int) {
        titleLabel.text = "Playlist"
        subtitleLabel.text = ""
        favoriteLabel.text = "Favorites"
        favoritesIcon.setImage(UIImage(systemName: "guitars.fill"), for: .normal)
        songsIndicatorLabel.text = "\(musics)\n Songs"
        recommendedLabel.text = "Recommended"
        self.backgroundColor = UIColor(rgb: 0xF0EEEF)
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
    }
    
    func setupContraints() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        favoriteView.translatesAutoresizingMaskIntoConstraints = false
        recommendedLabel.translatesAutoresizingMaskIntoConstraints = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        favoritesIcon.translatesAutoresizingMaskIntoConstraints = false
        favoriteLabel.translatesAutoresizingMaskIntoConstraints = false
        songsIndicatorLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: Space.base07.rawValue),
            titleLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: Space.base07.rawValue),
            subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: Space.base05.rawValue),
            subtitleLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: Space.base07.rawValue),
            
            favoriteView.topAnchor.constraint(equalTo: subtitleLabel.bottomAnchor, constant: Space.base07.rawValue),
            favoriteView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: Space.base07.rawValue),
            favoriteView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -Space.base07.rawValue),
            favoriteView.heightAnchor.constraint(equalToConstant: 190),
            
            favoritesIcon.topAnchor.constraint(equalTo: favoriteView.topAnchor, constant: Space.base05.rawValue),
            favoritesIcon.leadingAnchor.constraint(equalTo: favoriteView.leadingAnchor, constant: Space.base05.rawValue),
            favoritesIcon.heightAnchor.constraint(equalToConstant: 40),
            favoritesIcon.widthAnchor.constraint(equalToConstant: 40),
            
            favoriteLabel.topAnchor.constraint(equalTo: favoritesIcon.bottomAnchor, constant: Space.base09.rawValue),
            favoriteLabel.leadingAnchor.constraint(equalTo: favoriteView.leadingAnchor, constant: Space.base05.rawValue),
            
            songsIndicatorLabel.bottomAnchor.constraint(equalTo: favoriteView.bottomAnchor , constant: -Space.base07.rawValue),
            songsIndicatorLabel.trailingAnchor.constraint(equalTo: favoriteView.trailingAnchor, constant: -Space.base05.rawValue),
            
            recommendedLabel.topAnchor.constraint(equalTo: favoriteView.bottomAnchor, constant: Space.base07.rawValue),
            recommendedLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: Space.base07.rawValue),
            
            collectionView.topAnchor.constraint(equalTo: recommendedLabel.bottomAnchor, constant: Space.base07.rawValue),
            collectionView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: Space.base07.rawValue),
            collectionView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: Space.none.rawValue),
            collectionView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -Space.base12.rawValue)
           ])
    }
}
