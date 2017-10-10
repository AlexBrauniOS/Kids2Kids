//
//  HelpDetailsViewController.swift
//  Kids2Kids
//
//  Created by Oleksii Liubarets on 08.09.17.
//  Copyright © 2017 Oleksii Liubarets. All rights reserved.
//

import UIKit

class HelpDetailsViewController: UIViewController {
    
    @IBOutlet weak var helpDescriptionTextView: UILabel!
    
    var help: Help!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        setupBG()
    }
    
    func setup() {
        navigationItem.title = help.name
        
        helpDescriptionTextView.text = help.description
        helpDescriptionTextView.backgroundColor = UIColor.white.withAlphaComponent(0.95)
        helpDescriptionTextView.layer.cornerRadius = 5
        helpDescriptionTextView.clipsToBounds = true
        
        if #available(iOS 11.0, *) {
            self.navigationItem.largeTitleDisplayMode = .never
        } else {
            // Fallback on earlier versions
        }
    }
    
    func setupBG() {
        let background = UIImageView(frame: UIScreen.main.bounds)
        background.image = UIImage(named: "Background")
        background.contentMode = .scaleAspectFill
        background.clipsToBounds = true
        self.view.insertSubview(background, at: 0)
    }
}
