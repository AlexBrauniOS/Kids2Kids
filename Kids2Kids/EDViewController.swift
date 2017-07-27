//
//  EDViewController.swift
//  Kids2Kids
//
//  Created by Oleksii Liubarets on 26.07.17.
//  Copyright © 2017 Oleksii Liubarets. All rights reserved.
//

import UIKit

class EDViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLabel.text = nameEvent!
        
        // Do any additional setup after loading the view.
    }

    var nameEvent: String? {
        didSet{
            print(nameEvent!)
//
            
        }
    }
}
