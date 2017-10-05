//
//  NavigationController.swift
//  Kids2Kids
//
//  Created by Oleksii Liubarets on 04.10.17.
//  Copyright © 2017 Oleksii Liubarets. All rights reserved.
//

import UIKit

class NavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
    }

    func setup() {
        navigationBar.tintColor = .fundBlueColor
        navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.fundBlueColor, NSFontAttributeName: UIFont(name: "Co Text Corp", size: 19)!]
        if #available(iOS 11.0, *) {
            navigationBar.prefersLargeTitles = true
            navigationBar.largeTitleTextAttributes = [NSForegroundColorAttributeName: UIColor.fundBlueColor, NSFontAttributeName: UIFont(name: "Co Text Corp", size: 33)!]
            
        } else {
            // Fallback on earlier versions
        }
        
    }
}
