//
//  TabBarController.swift
//  Kids2Kids
//
//  Created by Oleksii Liubarets on 04.10.17.
//  Copyright © 2017 Oleksii Liubarets. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
    }

    func setup() {
        tabBar.tintColor = .fundBlueColor
        tabBar.unselectedItemTintColor = .darkGray
    }
}
