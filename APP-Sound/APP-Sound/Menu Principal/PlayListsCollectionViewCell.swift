import UIKit
import EMTNeumorphicView

class PlayListsCollectionViewCell: UICollectionViewCell {
    @IBOutlet var backView: EMTNeumorphicButton!
    @IBOutlet var iconView: EMTNeumorphicButton!
    @IBOutlet var iconImage: UIImageView!
    @IBOutlet var albumNameLabel: UILabel!
    
    private lazy var favoriteView: EMTNeumorphicButton = {
        var button = EMTNeumorphicButton()
        button.neumorphicLayer?.cornerRadius = 20
        button.neumorphicLayer?.elementBackgroundColor = NeumorphicColor.base01.color.cgColor
        button.neumorphicLayer?.edged = true
        button.neumorphicLayer?.depthType = .concave
        button.neumorphicLayer?.borderColor = UIColor.black.cgColor
        button.isUserInteractionEnabled = false
        return button
    }()
    
    private lazy var favoritesIcon: EMTNeumorphicButton = {
        var button = EMTNeumorphicButton()
        button.contentMode = .scaleAspectFit
        button.neumorphicLayer?.elementBackgroundColor = NeumorphicColor.base01.color.cgColor
        button.neumorphicLayer?.cornerRadius = 20
        button.neumorphicLayer?.elementDepth = 7
        button.neumorphicLayer?.edged = true
        return button
    }()
    
    private lazy var iconImageView: UIImageView = {
        var button = UIImageView()
        
        return button
    }()
    
    private lazy var albumName: UILabel = {
        var label = UILabel()
        return label
    }()
    
    private func setupCell() {
        favoriteView.addSubview(favoritesIcon)
        favoriteView.addSubview(iconImageView)
        favoriteView.addSubview(albumName)
        contentView.addSubview(favoriteView)
        contentView.backgroundColor = NeumorphicColor.base01.color
    }
    
    func setup(music: Music) {
        setupCell()
        
        albumName.text = music.songAlbum
        let image = UIImage(systemName: "guitars.fill")
        favoritesIcon.setImage(image, for: .normal)
        
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
            
            favoritesIcon.topAnchor.constraint(equalTo: favoriteView.topAnchor, constant: Space.base03.rawValue),
            favoritesIcon.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: Space.base03.rawValue),
            favoritesIcon.heightAnchor.constraint(equalToConstant: 40),
            favoritesIcon.widthAnchor.constraint(equalToConstant: 40),
            
            albumName.bottomAnchor.constraint(equalTo: favoriteView.bottomAnchor, constant: -Space.base07.rawValue),
            albumName.leadingAnchor.constraint(equalTo: favoriteView.leadingAnchor, constant: Space.base03.rawValue)
        ])
       
        
    }
}
