//
//  HelpDetailsViewController.swift
//  Kids2Kids
//
//  Created by Oleksii Liubarets on 08.09.17.
//  Copyright © 2017 Oleksii Liubarets. All rights reserved.
//

import UIKit

class HelpDetailsViewController: UIViewController {
    
    @IBOutlet weak var helpDescriptionTextView: UITextView!
    
    var help: Help!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    func setup() {
        helpDescriptionTextView.text = help.description
    }

}
