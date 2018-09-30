//
//  VR360Controller.swift
//  THEOPlayerDemo
//
//  Created by Slobodan Novakovic on 9/30/18.
//  Copyright © 2018 Slobo. All rights reserved.
//

import UIKit
import THEOplayerSDK

class VR360Controller: UIViewController {
    
    lazy var theoPlayer: THEOplayer = {
        let tP = THEOplayer()
        tP.source = sampleSource
        tP.autoplay = true
        return tP
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Close", style: .plain, target: self, action: #selector(handleCloseTheoPlayer))
        navigationItem.leftBarButtonItem?.tintColor = .black
        
        navigationItem.title = "VR/360 Video"
        
        setupUI()
    }
    
    @objc private func handleCloseTheoPlayer() {
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
    }
    
    private var sampleSource: SourceDescription {
        return SourceDescription(
            source: TypedSource(
                src: "https://demo.theoplayer.com/hubfs/videos/natgeo/playlist.m3u8",
                type: SourceType.mp4.rawValue
            )
        )
    }
    
}
