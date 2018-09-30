//
//  SubtitlesController.swift
//  THEOPlayerDemo
//
//  Created by Slobodan Novakovic on 9/29/18.
//  Copyright © 2018 Slobo. All rights reserved.
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI() {
        view.backgroundColor = .white

        var frame: CGRect = UIScreen.main.bounds
        frame.origin.y = 0
        frame.size.height = frame.size.width * 9 / 16
        
        theoPlayer.frame =  frame
        theoPlayer.addAsSubview(of: self.view)
        
        attachEventListeners()
    }
    
    var sampleSource: SourceDescription {
        return SourceDescription(
            source: TypedSource(
                src: "https://cdn.theoplayer.com/video/elephants-dream/playlist.m3u8",
                type: SourceType.mp4.rawValue
            )
        )
    }
    
    func attachEventListeners() {
        
        self.listeners["subtitleChange"] = theoPlayer.audioTracks.addEventListener(type: TextTrackListEventTypes.CHANGE) { (eventProtocol) in
            print("Subtitle Changed:", eventProtocol.track.label)
        }
    }

}
