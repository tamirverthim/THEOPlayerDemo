//
//  FeatureCell.swift
//  THEOPlayerDemo
//
//  Created by Slobodan Novakovic on 9/30/18.
//  Copyright © 2018 Slobo. All rights reserved.
//

import UIKit

class FeatureCell: UITableViewCell {
    
    var feature: String? {
        didSet {
            if let feature = feature {
                labelName.text = feature
            }
        }
    }
    
    let labelName: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Feature"
        label.font = UIFont.boldSystemFont(ofSize: 20)
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(labelName)
        labelName.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 8).isActive = true
        labelName.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -8).isActive = true
        labelName.heightAnchor.constraint(equalToConstant: 20).isActive = true
        labelName.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
