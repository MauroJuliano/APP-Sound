import EMTNeumorphicView
import SnapKit
import UIKit

class SongListView: UIView {
    private let secondaryColor = UIColor(RGB: 0xF0EEEF)
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Lobster Two", size: 16)
        return label
    }()
    
    private lazy var subtitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Lobster Two", size: 12)
        return label
    }()
    
    lazy var playButton: EMTNeumorphicButton = {
        let view = EMTNeumorphicButton()
        view.neumorphicLayer?.elementBackgroundColor = secondaryColor.cgColor
        view.backgroundColor = UIColor(RGB: 0xF0EEEF)
        view.neumorphicLayer?.cornerRadius = 20
        view.setImage(UIImage(systemName: "play.fill"), for: .normal)
        view.setImage(UIImage(systemName: "pause"), for: .selected)
        view.tintColor = .systemIndigo
        view.neumorphicLayer?.edged = true
        view.neumorphicLayer?.borderColor = UIColor.black.cgColor
        view.addTarget(self, action: #selector(playButtonAction), for: .touchUpInside)
        return view
    }()
    
    private lazy var contentView: EMTNeumorphicButton = {
        let view = EMTNeumorphicButton()
        view.neumorphicLayer?.elementBackgroundColor = secondaryColor.cgColor
        view.neumorphicLayer?.depthType = .convex
        view.neumorphicLayer?.elementDepth = 7
        view.addTarget(self, action: #selector(contentButtonAction), for: .touchUpInside)
        return view
    }()
    
    var contentAction: () -> Void = { /* Intentionally unimplemented */ }
    var playAction: () -> Void = { /* Intentionally unimplemented */ }
    
    init(title: String, subtitle: String) {
        super.init(frame: .zero)
        self.titleLabel.text = title
        self.subtitleLabel.text = subtitle
        
        buildHierarchy()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func buildHierarchy() {
        contentView.addSubview(titleLabel)
        contentView.addSubview(subtitleLabel)
        contentView.addSubview(playButton)
        
        addSubview(contentView)
    }
    
    func setupConstraints() {
        contentView.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.height.equalTo(65)
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(Space.base02.rawValue)
            $0.trailing.equalTo(playButton.snp.leading).offset(Space.base03.rawValue)
            $0.leading.equalToSuperview().offset(Space.base07.rawValue)
        }
        
        subtitleLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom)
            $0.leading.equalToSuperview().offset(Space.base07.rawValue)
        }
        
        playButton.snp.makeConstraints {
            $0.trailing.equalToSuperview().offset(-Space.base05.rawValue)
            $0.width.height.equalTo(40)
            $0.centerY.equalToSuperview()
        }
    }
    
    @objc
    func contentButtonAction() {
        contentAction()
    }
    
    @objc
    func playButtonAction() {
        playAction()
    }
}
