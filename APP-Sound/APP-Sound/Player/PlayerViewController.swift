import UIKit
import EMTNeumorphicView
import SnapKit
import SwiftySound
import SwiftSiriWaveformView

protocol PlayerViewDisplaying: AnyObject {
    func displayScreen(singer: String, illustration: String, songName: String)
}

final class PlayerViewController: UIViewController {
    private lazy var backButton: EMTNeumorphicButton = {
        let view = EMTNeumorphicButton()
        view.neumorphicLayer?.cornerRadius = 20
        view.setImage(UIImage(systemName: "arrowshape.turn.up.left"), for: .normal)
        view.tintColor = .systemIndigo
        view.addTarget(self, action: #selector(backAction), for: .touchUpInside)
        return view
    }()
    
    private lazy var titleName: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont(name: "Lobster Two", size: 25)
        label.text = "PLAYING NOW"
        return label
    }()
    
    private lazy var previousButton: EMTNeumorphicButton = {
        let view = EMTNeumorphicButton()
        view.neumorphicLayer?.cornerRadius = 25
        view.setImage(UIImage(systemName: "backward.frame"), for: .normal)
        view.tintColor = .systemIndigo
        view.addTarget(self, action: #selector(previousAction), for: .touchUpInside)
        return view
    }()
        
    private lazy var playButton: EMTNeumorphicButton = {
        let view = EMTNeumorphicButton()
        view.neumorphicLayer?.cornerRadius = 40
        view.neumorphicLayer?.elementBackgroundColor = color2.cgColor
        view.neumorphicLayer?.edged = true
        view.neumorphicLayer?.borderColor = UIColor.black.cgColor
        view.setImage(UIImage(systemName: "play"), for: .normal)
        view.setImage(UIImage(systemName: "pause"), for: .selected)
        view.tintColor = .systemIndigo
        return view
    }()
    
    private lazy var forwardButton: EMTNeumorphicButton = {
        let view = EMTNeumorphicButton()
        view.neumorphicLayer?.cornerRadius = 25
        view.setImage(UIImage(systemName: "forward.end"), for: .normal)
        view.tintColor = .systemIndigo
        view.addTarget(self, action: #selector(forwardAction), for: .touchUpInside)
        return view
    }()
    
    private lazy var viewImage: EMTNeumorphicButton = {
        let view = EMTNeumorphicButton()
        view.neumorphicLayer?.elementBackgroundColor = color2.cgColor
        view.neumorphicLayer?.edged = true
        view.neumorphicLayer?.cornerRadius = 142
        return view
    }()
    
    private lazy var imageView: UIImageView = {
        let view = UIImageView()
        view.layer.cornerRadius = 137.5
        view.layer.masksToBounds = true
        view.contentMode = .scaleAspectFill
        return view
    }()
    
    private lazy var songTitle: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont(name: "Lobster Two", size: 20)
        label.text = "Somebody That I Used To Know"
        return label
    }()
    
    private lazy var singerTitle: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont(name: "Lobster Two", size: 15)
        label.text = "Gotye"
        return label
    }()
    
    private lazy var progressView: SwiftSiriWaveformView = {
        let view = SwiftSiriWaveformView()
        view.backgroundColor = color2
        view.waveColor = .systemPurple
        view.frequency = 3
        view.amplitude = 1
        return view
    }()
    
//    var timer:Timer?
//    @IBOutlet var currentTimeLabel: UILabel!
//    @IBOutlet var durationSongLabel: UILabel!
//    var change:CGFloat = 0.01
//    private var songSound: Sound?
//    var musicSelected: Music?
//    var musicArray = [Music]()
//    var controller: PlayerController?
//    var musicController = NewSong()
    let color2 = UIColor(RGB: 0xF0EEEF)
    var interactor: PlayerViewInteracting
    var songName: String = ""
    var singer: String = ""
    
    init(interactor: PlayerViewInteracting) {
        self.interactor = interactor
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = color2
        interactor.loadSong()
        buildHierarchy()
        setupContraints()

    }
    
    func buildHierarchy() {
        view.addSubview(backButton)
        view.addSubview(titleName)
        viewImage.addSubview(imageView)
        view.addSubview(viewImage)
        view.addSubview(songTitle)
        view.addSubview(singerTitle)
        view.addSubview(progressView)
        view.addSubview(previousButton)
        view.addSubview(playButton)
        view.addSubview(forwardButton)
    }
    
    func setupContraints() {
        backButton.snp.makeConstraints {
            $0.top.equalToSuperview().offset(Space.base10.rawValue)
            $0.leading.equalToSuperview().offset(Space.base06.rawValue)
            $0.height.width.equalTo(40)
        }
        
        titleName.snp.makeConstraints {
            $0.top.equalToSuperview().offset(Space.base10.rawValue)
            $0.centerX.equalToSuperview()
        }
        
        viewImage.snp.makeConstraints {
            $0.top.equalTo(titleName.snp.bottom).offset(Space.base06.rawValue)
            $0.centerX.equalToSuperview()
            $0.width.height.equalTo(290)
        }
        
        imageView.snp.makeConstraints {
            $0.centerY.centerX.equalTo(viewImage)
            $0.width.height.equalTo(275)
        }
        
        songTitle.snp.makeConstraints {
            $0.top.equalTo(viewImage.snp.bottom).offset(Space.base06.rawValue)
            $0.centerX.equalToSuperview()
        }
        
        singerTitle.snp.makeConstraints {
            $0.top.equalTo(songTitle.snp.bottom).offset(Space.base03.rawValue)
            $0.centerX.equalToSuperview()
        }
        
        progressView.snp.makeConstraints {
            $0.top.equalTo(singerTitle.snp.bottom).offset(Space.base10.rawValue)
            $0.leading.trailing.equalToSuperview().inset(Space.base10.rawValue)
            $0.height.equalTo(56)
        }
        
        previousButton.snp.makeConstraints {
            $0.top.equalTo(progressView.snp.bottom).offset(Space.base10.rawValue)
            $0.leading.equalToSuperview().inset(Space.base11.rawValue)
            $0.width.height.equalTo(50)
        }
        
        playButton.snp.makeConstraints {
            $0.top.equalTo(progressView.snp.bottom).offset(Space.base07.rawValue)
            $0.centerX.equalToSuperview()
            $0.height.width.equalTo(86)
        }
        
        forwardButton.snp.makeConstraints {
            $0.top.equalTo(progressView.snp.bottom).offset(Space.base10.rawValue)
            $0.leading.equalTo(playButton.snp.trailing).offset(Space.base07.rawValue)
            $0.width.height.equalTo(50)
        }
    }
    
//    func timerProgressSetup(){
//        timer = Timer.scheduledTimer(timeInterval: 0.03, target: self, selector: #selector(refreshAudioView(_:)), userInfo: nil, repeats: true)
//    }
    
//    override func viewWillAppear(_ animated: Bool) {
//        buildHierarchy()
//        getSongs()
//    }
//
//    func getSongs(){
//        musicController.addNewSongs(completionHandler: { success, _ in
//            if success{
//                self.musicArray = self.musicController.musicArray
//                self.controller?.arraySetup()
//            }
//        })
//    }
    
  //  @objc internal func refreshAudioView(_:Timer) {
        
//        if self.siriProgressView.amplitude <= self.siriProgressView.idleAmplitude || self.siriProgressView.amplitude > 1.0 {
//            self.change *= -1.0
//        }
//        // Simply set the amplitude to whatever you need and the view will update itself.
//        self.siriProgressView.amplitude += self.change
  //  }
    
//    @IBAction func backButton(_ sender: Any) {
//        self.dismiss(animated: true, completion: nil)
//    }
    
//
//    @IBAction func playButton(_ sender: Any) {
//        playButton.setImage(UIImage(systemName: "pause"), for: .selected)
//
//        if playButton.isSelected == false {
//            let resume = try? controller?.resumeNow(playingSong: musicSelected)
//        }else {
//            controller?.pausePlayer()
//        }
//        controller?.progressSetup()
//    }
    
//    @IBAction func previousSongButton(_ sender: Any) {
//        controller?.previousSong()
//    }
//    @IBAction func nextSongButton(_ sender: Any) {
//        controller?.nextSong()
//    }
    
    @objc
    func backAction() {
        interactor.openSonglist()
    }
    @objc
    func previousAction() {
        interactor.previousButton(singer: singer , song: songName)
    }
    
    @objc
    func playAction() {
        guard !playButton.isSelected else {
            playButton.isSelected = false
            interactor.pauseButton()
            return
        }
        
        interactor.playSong(currentSong: songName)
        playButton.isSelected = true
    }
    
    @objc
    func forwardAction() {
        interactor.forwardButton()
    }
    
}
extension PlayerViewController: PlayerViewDisplaying {
    func displayScreen(singer: String, illustration: String, songName: String) {
        songTitle.text = songName
        singerTitle.text = singer
        imageView.image = UIImage(named: illustration)
        self.songName = songName
        self.singer = singer
        playButton.addTarget(self, action: #selector(playAction), for: .touchUpInside)
    }
}

extension UIView {
    
    func roundCorners(_ corners: UIRectCorner, radius: CGFloat) {
         let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
         let mask = CAShapeLayer()
         mask.path = path.cgPath
         self.layer.mask = mask
    }
}
