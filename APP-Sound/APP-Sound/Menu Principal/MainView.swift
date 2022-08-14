import UIKit
import EMTNeumorphicView
import AVFoundation

class MainView: UIView {
    private lazy var titleLabel: UILabel = {
        var label = UILabel()
        label.textAlignment = .left
        return label
    }()
    
    private lazy var subtitleLabel: UILabel = {
        var label = UILabel()
        label.textAlignment = .left
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
        return button
    }()
    
    private lazy var iconImageView: UIImageView = {
        var view = UIImageView()
        return view
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
        return label
    }()
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 205, height: 205)
        layout.scrollDirection = .horizontal
        var view = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        view.register(PlayListsCollectionViewCell.self, forCellWithReuseIdentifier: "PlayListCell")
        view.backgroundColor = .clear
        return view
    }()
   
    init() {
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        titleLabel.text = "OI"
        subtitleLabel.text = "dsadsadsa"
        favoriteLabel.text = "ds"
        songsIndicatorLabel.text = "nbn"
        recommendedLabel.text = "jghjghjhg"
        self.backgroundColor = UIColor(rgb: 0xF0EEEF)
        buildHierarchy()
        setupContraints()
    }
    
    func buildHierarchy() {
        favoritesIcon.addSubview(iconImageView)
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
            titleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: Space.base02.rawValue),
            titleLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: Space.base04.rawValue),
            subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: Space.base01.rawValue),
            subtitleLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: Space.base04.rawValue),
            favoriteView.topAnchor.constraint(equalTo: subtitleLabel.bottomAnchor, constant: Space.base07.rawValue),
            favoriteView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: Space.base05.rawValue),
            favoriteView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -Space.base04.rawValue),
            favoriteView.heightAnchor.constraint(equalToConstant: Space.base10.rawValue),
            iconImageView.topAnchor.constraint(equalTo: favoritesIcon.topAnchor, constant: 0),
            iconImageView.leadingAnchor.constraint(equalTo: favoritesIcon.leadingAnchor, constant: 0),
            iconImageView.trailingAnchor.constraint(equalTo: favoritesIcon.trailingAnchor, constant: 0),
            iconImageView.bottomAnchor.constraint(equalTo: favoritesIcon.bottomAnchor, constant: 0),
            favoritesIcon.topAnchor.constraint(equalTo: favoriteView.topAnchor, constant: Space.base03.rawValue),
            favoritesIcon.leadingAnchor.constraint(equalTo: favoriteView.leadingAnchor, constant: Space.base03.rawValue),
            favoriteLabel.topAnchor.constraint(equalTo: favoritesIcon.bottomAnchor, constant: Space.base03.rawValue),
            favoriteLabel.leadingAnchor.constraint(equalTo: favoriteView.leadingAnchor, constant: Space.base03.rawValue),
            songsIndicatorLabel.bottomAnchor.constraint(equalTo: favoriteView.bottomAnchor , constant: -Space.base04.rawValue),
            songsIndicatorLabel.trailingAnchor.constraint(equalTo: favoriteView.trailingAnchor, constant: -Space.base03.rawValue),
            recommendedLabel.topAnchor.constraint(equalTo: favoriteView.bottomAnchor, constant: Space.base04.rawValue),
            recommendedLabel.leadingAnchor.constraint(equalTo: favoriteView.leadingAnchor, constant: Space.base03.rawValue),
            collectionView.topAnchor.constraint(equalTo: recommendedLabel.bottomAnchor, constant: 32),
            collectionView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: Space.base04.rawValue),
            collectionView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: 0),
            collectionView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -Space.base07.rawValue)
           ])
    }
}

// TODO: Another file

public enum Space: CGFloat {
    case base00 = 0
    case base01 = 8
    case base02 = 17
    case base03 = 30
    case base04 = 35
    case base05 = 40
    case base07 = 64
    case base10 = 190

}
