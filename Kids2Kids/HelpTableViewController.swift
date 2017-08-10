//
//  TableViewController.swift
//  Kids2Kids
//
//  Created by Oleksii Liubarets on 09.08.17.
//  Copyright © 2017 Oleksii Liubarets. All rights reserved.
//

import UIKit

class HelpTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

    func setup() {
        
        self.navigationItem.title = "Помощь"
        self.navigationController!.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.fundBlueColor, NSFontAttributeName: UIFont(name: "Co Text Corp", size: 19)!]
        
        let background = UIImage(named: "Background")
        let imageView: UIImageView!
        imageView = UIImageView(frame: view.bounds)
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = background!
        self.tableView.backgroundView = imageView
    }
    
}
