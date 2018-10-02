//
//  Alert.swift
//  THEOPlayerDemo
//
//  Created by Slobodan Novakovic on 10/2/18.
//  Copyright © 2018 Slobo. All rights reserved.
//

import Foundation
import UIKit

struct Alert {
    static func showBasicAlert(on vc: UIViewController, tittle: String, message: String) {
        let alertAction =  UIAlertAction(title: "OK", style: .default, handler: nil)
        let alert = UIAlertController(title: tittle, message: message, preferredStyle: .alert)
        alert.addAction(alertAction)
        
        DispatchQueue.main.async {
            vc.present(alert, animated: true, completion: nil)
        }
    }
}
