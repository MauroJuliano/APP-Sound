import EMTNeumorphicView
import SnapKit
import UIKit

class MusicSheet: UIView {
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
    
    private lazy var albumImageView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFill
        view.layer.masksToBounds = true
        view.layer.cornerRadius = 30
        return view
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
    
    private lazy var albumImage: EMTNeumorphicView = {
        let view = EMTNeumorphicView()
        view.neumorphicLayer?.cornerRadius = 35
        view.neumorphicLayer?.elementBackgroundColor = secondaryColor.cgColor
        view.backgroundColor = UIColor(RGB: 0xF0EEEF)
        return view
    }()
    
    var playAction: () -> Void = { /* Intentionally unimplemented */ }
    
    init() {
        super.init(frame: .zero)
    
        configureView()
        buildHierarchy()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func buildHierarchy() {
        addSubview(albumImage)
        addSubview(albumImageView)
        addSubview(titleLabel)
        addSubview(subtitleLabel)
        addSubview(playButton)
    }
    
    func setupConstraints() {
        albumImage.snp.makeConstraints {
            $0.leading.top.equalToSuperview().inset(Space.base03.rawValue)
            $0.width.height.equalTo(70)
        }
        
        albumImageView.snp.makeConstraints {
            $0.centerX.centerY.equalTo(albumImage)
            $0.width.height.equalTo(60)
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(Space.base05.rawValue)
            $0.leading.equalTo(albumImage.snp.trailing).offset(Space.base03.rawValue)
        }

        subtitleLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(Space.base02.rawValue)
            $0.leading.equalTo(albumImage.snp.trailing).offset(Space.base03.rawValue)
        }
        
        playButton.snp.makeConstraints {
            $0.top.trailing.equalToSuperview().inset(Space.base06.rawValue)
            $0.width.height.equalTo(40)
        }
    }
    
    func setup(title: String, subtitle: String, illustration: String) {
        self.titleLabel.text = title
        self.subtitleLabel.text = subtitle
        self.albumImageView.image = UIImage(named: illustration)
    }
    
    func configureView() {
        layer.borderWidth = 0.2
        layer.borderColor = UIColor.black.cgColor
        
        layer.backgroundColor = UIColor.white.cgColor
        clipsToBounds = true
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        layer.shadowOpacity = 0.5
        layer.shadowRadius = -25.0
        layer.masksToBounds = false
        layer.cornerRadius = 30
        
        let blur = UIBlurEffect(style: .light)
        let blurEffect = UIVisualEffectView(effect: blur)
        blurEffect.frame = self.bounds
        blurEffect.alpha = 0.8
        blurEffect.layer.cornerRadius = 30
        blurEffect.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        addSubview(blurEffect)
//
//        let vibrancyEffect = UIVibrancyEffect(blurEffect: blur)
//        let vibrancyEffectView = UIVisualEffectView(effect: vibrancyEffect)
//        vibrancyEffectView.frame = self.bounds
//        vibrancyEffectView.layer.cornerRadius = 30
//        addSubview(vibrancyEffectView)
        
    }
    
    @objc
    func playButtonAction() {
        playAction()
    }
}
