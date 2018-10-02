//
//  FeaturesController.swift
//  THEOPlayerDemo
//
//  Created by Slobodan Novakovic on 9/30/18.
//  Copyright © 2018 Slobo. All rights reserved.
//

import UIKit

class FeaturesController: UITableViewController {
    
    let cellId = "cellId"
    let arrayFeaturesList = ["Subtitles", "Multiple Audio Tracks", "VR/360"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView() {
        
        navigationItem.title = "THEOplayer Features"
        
        tableView.register(FeatureCell.self, forCellReuseIdentifier: cellId)
        tableView.backgroundColor = .white
        tableView.separatorColor = .red
        tableView.tableFooterView = UIView()
        tableView.layoutMargins = UIEdgeInsets.zero
        tableView.separatorInset = UIEdgeInsets.zero
    }
}
