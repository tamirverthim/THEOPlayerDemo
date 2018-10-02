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
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayFeaturesList.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! FeatureCell
        
        let feature = arrayFeaturesList[indexPath.row]
        cell.feature = feature
        cell.layoutMargins = UIEdgeInsets.zero
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if !Reachability.isConnectedToNetwork() {
            Alert.showBasicAlert(on: self, tittle: "No Internet connection!", message: " Please, connect to the Interent to test the THEOplayer's features.")
            return
        }
        
        switch indexPath.row {
            case 0:
                let subtitlesController = SubtitlesController()
                self.navigationController?.pushViewController(subtitlesController, animated: true)
            break
            case 1:
                let audioController = AudioController()
                self.navigationController?.pushViewController(audioController, animated: true)
            break
            case 2:
                let vr360Controller = VR360Controller()
                self.navigationController?.pushViewController(vr360Controller, animated: true)
            break
            default:
            print("Feature needs to be implemented.")
        }
    }
   
}
