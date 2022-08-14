import UIKit
import EMTNeumorphicView

class PlayListsCollectionViewCell: UICollectionViewCell {
    @IBOutlet var backView: EMTNeumorphicButton!
    @IBOutlet var iconView: EMTNeumorphicButton!
    @IBOutlet var iconImage: UIImageView!
    @IBOutlet var albumNameLabel: UILabel!
    
    private lazy var favoriteView: EMTNeumorphicButton = {
        var button = EMTNeumorphicButton()
        button.contentMode = .scaleToFill
        button.neumorphicLayer?.cornerRadius = 20
        button.neumorphicLayer?.elementBackgroundColor = color2.cgColor
        button.neumorphicLayer?.edged = true
        button.neumorphicLayer?.depthType = .concave
        button.neumorphicLayer?.borderColor = UIColor.black.cgColor
        return button
    }()
    
    private lazy var favoritesIcon: EMTNeumorphicButton = {
        var button = EMTNeumorphicButton()
        button.neumorphicLayer?.elementBackgroundColor = color2.cgColor  ?? UIColor.white.cgColor
        button.neumorphicLayer?.cornerRadius = 20
        
        button.neumorphicLayer?.elementDepth = 7
        return button
    }()
    
    private lazy var iconImageView: EMTNeumorphicButton = {
        var button = EMTNeumorphicButton()
        
        return button
    }()
    
    private lazy var albumName: UILabel = {
        var label = UILabel()
        return label
    }()
    
    let color2 = UIColor(rgb: 0xF0EEEF)
    
    func setup(music: Music) {
        
        favoriteView.addSubview(favoritesIcon)
        favoriteView.addSubview(iconImageView)
        favoriteView.addSubview(albumName)
        contentView.addSubview(favoriteView)
        contentView.backgroundColor = NeumorphicColor.base01.color
    //    albumNameLabel.text = music.songAlbum
        
//        backView.neumorphicLayer?.cornerRadius = 20
//        backView.neumorphicLayer?.elementBackgroundColor = color2.cgColor ?? UIColor.white.cgColor
//        backView.neumorphicLayer?.edged = true
//        backView.neumorphicLayer?.depthType = .concave
//        backView.neumorphicLayer?.borderColor = UIColor.black.cgColor
//
//        iconView.neumorphicLayer?.elementBackgroundColor = color2.cgColor  ?? UIColor.white.cgColor
//        iconView.neumorphicLayer?.cornerRadius = 20

//        iconView.neumorphicLayer?.elementDepth = 7
        
        albumName.text = music.songAlbum
        setupConstraints()
    }
    
    func setupConstraints() {
        favoriteView.translatesAutoresizingMaskIntoConstraints = false
        favoritesIcon.translatesAutoresizingMaskIntoConstraints = false
        albumName.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            favoriteView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: Space.base00.rawValue),
            favoriteView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: Space.base00.rawValue),
            favoriteView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: Space.base00.rawValue),
            favoriteView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: Space.base00.rawValue),
            favoritesIcon.topAnchor.constraint(equalTo: favoriteView.bottomAnchor, constant: Space.base03.rawValue),
            favoritesIcon.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: Space.base03.rawValue),
            albumName.topAnchor.constraint(equalTo: favoritesIcon.bottomAnchor, constant: Space.base04.rawValue),
            albumName.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: Space.base03.rawValue)
        ])
       
        
    }
}
