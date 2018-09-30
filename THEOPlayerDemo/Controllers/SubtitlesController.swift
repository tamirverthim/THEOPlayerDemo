//
//  SubtitlesController.swift
//  THEOPlayerDemo
//
//  Created by Slobodan Novakovic on 9/29/18.
//  Copyright © 2018 Slobo. All rights reserved.viw
//
import UIKit
import THEOplayerSDK

class SubtitlesController: UIViewController {

    var listeners = [String: EventListener]()
    
    lazy var theoPlayer: THEOplayer = {
        let tP = THEOplayer()
        tP.source = sampleSource
        tP.autoplay = true
        return tP
    }()
    
    let labelSubtitleDescription: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Current subtitle:"
        return label
    }()
    
    let labelSubtitleLanguage: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.italicSystemFont(ofSize: 20)
        label.text = "None"
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Close", style: .plain, target: self, action: #selector(handleCloseTheoPlayer))
        navigationItem.leftBarButtonItem?.tintColor = .black
        
        setupUI()
    }
    
    @objc func handleCloseTheoPlayer() {
        theoPlayer.destroy()
        navigationController?.popViewController(animated: true)
    }
    
    func setupUI() {
        view.backgroundColor = .white

        var frame: CGRect = UIScreen.main.bounds
        frame.origin.y = 0
        
        let playerHeight = frame.size.width * 9 / 16
        frame.size.height = playerHeight
        
        theoPlayer.frame =  frame
        theoPlayer.addAsSubview(of: self.view)
        
        view.addSubview(labelSubtitleDescription)
        labelSubtitleDescription.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: playerHeight + 10).isActive = true
        labelSubtitleDescription.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        labelSubtitleDescription.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        labelSubtitleDescription.heightAnchor.constraint(equalToConstant: 24).isActive = true
        
        
        view.addSubview(labelSubtitleLanguage)
        labelSubtitleLanguage.topAnchor.constraint(equalTo: labelSubtitleDescription.bottomAnchor, constant: 10).isActive = true
        labelSubtitleLanguage.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        labelSubtitleLanguage.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        labelSubtitleLanguage.heightAnchor.constraint(equalToConstant: 24).isActive = true
    
        attachEventListeners()
    }
    
    var sampleSource: SourceDescription {
        return SourceDescription(
            source: TypedSource(
                src: "https://cdn.theoplayer.com/video/sintel/index.m3u8",
                type: SourceType.mp4.rawValue
            )
        )
    }
    
    func attachEventListeners() {
        self.listeners["subtitleChange"] = theoPlayer.textTracks.addEventListener(type: TextTrackListEventTypes.CHANGE) { (eventProtocol) in
                self.labelSubtitleLanguage.text = eventProtocol.track.label
        }
    }

}
