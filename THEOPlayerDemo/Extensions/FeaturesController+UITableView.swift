//
//  FeaturesController+UITableView.swift
//  THEOPlayerDemo
//
//  Created by Slobodan Novakovic on 10/2/18.
//  Copyright © 2018 Slobo. All rights reserved.
//

import UIKit

extension FeaturesController {
    
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
