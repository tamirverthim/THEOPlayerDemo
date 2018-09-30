//
//  AudioController.swift
//  THEOPlayerDemo
//
//  Created by Slobodan Novakovic on 9/30/18.
//  Copyright © 2018 Slobo. All rights reserved.
//

import UIKit
import THEOplayerSDK

class AudioController: UIViewController {
    
    private var listeners = [String: EventListener]()
    
    lazy var theoPlayer: THEOplayer = {
        let tP = THEOplayer()
        tP.source = sampleSource
        tP.autoplay = true
        return tP
    }()
    
    let labelAudioDescription: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Current audio:"
        return label
    }()
    
    let labelAudioLanguage: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.italicSystemFont(ofSize: 20)
        label.text = "English"
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Close", style: .plain, target: self, action: #selector(handleCloseTheoPlayer))
        navigationItem.leftBarButtonItem?.tintColor = .black
        
        navigationItem.title = "Audio Tracks"
        
        setupUI()
    }
    
    @objc private func handleCloseTheoPlayer() {
        removeEventListeners()
        theoPlayer.destroy()
        navigationController?.popViewController(animated: true)
    }
    
    private func setupUI() {
        view.backgroundColor = .white
        
        var frame: CGRect = UIScreen.main.bounds
        frame.origin.y = 0
        
        let playerHeight = frame.size.width * 9 / 16
        frame.size.height = playerHeight
        
        theoPlayer.frame =  frame
        theoPlayer.addAsSubview(of: self.view)
        
        view.addSubview(labelAudioDescription)
        labelAudioDescription.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: playerHeight + 10).isActive = true
        labelAudioDescription.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        labelAudioDescription.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        labelAudioDescription.heightAnchor.constraint(equalToConstant: 24).isActive = true
        
        
        view.addSubview(labelAudioLanguage)
        labelAudioLanguage.topAnchor.constraint(equalTo: labelAudioDescription.bottomAnchor, constant: 10).isActive = true
        labelAudioLanguage.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        labelAudioLanguage.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        labelAudioLanguage.heightAnchor.constraint(equalToConstant: 24).isActive = true
        
        attachEventListeners()
    }
    
    private var sampleSource: SourceDescription {
        return SourceDescription(
            source: TypedSource(
                src: "https://cdn.theoplayer.com/video/elephants-dream/playlist.m3u8",
                type: SourceType.mp4.rawValue
            )
        )
    }
    
    private func attachEventListeners() {
        self.listeners["audioChange"] = theoPlayer.audioTracks.addEventListener(type: AudioTrackListEventTypes.CHANGE) { (eventProtocol) in
            self.labelAudioLanguage.text = eventProtocol.track.label
        }
    }
    
    private func removeEventListeners() {
        theoPlayer.audioTracks.removeEventListener(type: AudioTrackListEventTypes.CHANGE, listener: listeners["audioChange"]!)
    }
}
