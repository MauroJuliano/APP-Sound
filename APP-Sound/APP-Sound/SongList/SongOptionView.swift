import EMTNeumorphicView
import SnapKit
import UIKit

class SongOptionView: UIView {
    private let secondaryColor = UIColor(RGB: 0xF0EEEF)
    private lazy var contentView = UIView()

    private lazy var scrollView: UIScrollView = {
        let view = UIScrollView()
        return view
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private lazy var backButton: EMTNeumorphicButton = {
        let view = EMTNeumorphicButton()
        view.neumorphicLayer?.elementBackgroundColor = secondaryColor.cgColor
        view.backgroundColor = UIColor(RGB: 0xF0EEEF)
        view.neumorphicLayer?.cornerRadius = 20
        view.setImage(UIImage(systemName: "return"), for: .normal)
        view.tintColor = .systemIndigo
        return view
    }()
    
    private lazy var albumImageView: UIImageView = {
        let view = UIImageView()
        view.layer.cornerRadius = 82.5
        view.image = UIImage(named: "gotye")
        view.layer.masksToBounds = true
        return view
    }()
    
    private lazy var albumImage: EMTNeumorphicView = {
        let view = EMTNeumorphicView()
        view.neumorphicLayer?.cornerRadius = 90
        view.neumorphicLayer?.elementBackgroundColor = secondaryColor.cgColor
        view.backgroundColor = UIColor(RGB: 0xF0EEEF)
        return view
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 5
        return stackView
    }()
    
    var backAction = { /* Intentionally unimplemented */ }
    
    init() {
        super.init(frame: .zero)
        configureView()
        buildHierarchy()
        setupContraints()
        titleLabel.text = "duhahuhsu udsahdhu"
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func buildHierarchy() {
        albumImage.addSubview(albumImageView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(backButton)
        contentView.addSubview(albumImage)
        contentView.addSubview(stackView)
        
        scrollView.addSubview(contentView)
        addSubview(scrollView)
        
    }
    
    func setupContraints() {
        contentView.snp.makeConstraints {
            $0.edges.width.equalTo(scrollView)
        }
        
        scrollView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(Space.base10.rawValue)
            $0.centerX.equalToSuperview()
        }
        
        albumImageView.snp.makeConstraints {
            $0.centerX.centerY.equalTo(albumImage)
            $0.width.height.equalTo(165)
        }
        
        backButton.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(Space.base13.rawValue)
            $0.leading.equalToSuperview().offset(Space.base07.rawValue)
            $0.width.height.equalTo(40)
        }
        
        albumImage.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(Space.base04.rawValue)
            $0.centerX.equalToSuperview()
            $0.width.height.equalTo(180)
        }
        
        stackView.snp.makeConstraints {
            $0.top.equalTo(albumImage.snp.bottom).offset(Space.base09.rawValue)
            $0.leading.trailing.bottom.equalTo(contentView)
        }
    }
    
    func setupUI(title: String, Illustration: String, songList: [Music]) {
        titleLabel.text = title
        albumImageView.image = UIImage(named: Illustration)
        
        songList.forEach { song in
            let list = SongListView(title: song.songName, subtitle: song.songAutor)
            stackView.addArrangedSubview(list)
        }
    }
    
    func configureView() {
        backgroundColor = secondaryColor
    }
}
    
