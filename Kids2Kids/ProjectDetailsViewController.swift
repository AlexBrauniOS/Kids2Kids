//
//  ProjectDetailsViewController.swift
//  Kids2Kids
//
//  Created by Oleksii Liubarets on 21.07.17.
//  Copyright © 2017 Oleksii Liubarets. All rights reserved.
//

import UIKit

class ProjectDetailsViewController: UIViewController {
    @IBOutlet weak var projectInDetailsImageView: UIImageView!
    @IBOutlet weak var projectInDetailsLabel: UILabel!

    var projects: Project!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBG()
        setup()
    }
    
    func setupBG() {

        let background = UIImageView(frame: UIScreen.main.bounds)
        background.image = UIImage(named: "Background")
        background.contentMode = .scaleAspectFill
        self.view.insertSubview(background, at: 0)
 
    }

    func setup() {
        navigationItem.title = projects.projectName
        projectInDetailsImageView.image = projects.projectImage
        projectInDetailsLabel.text = projects.projectDescription
        projectInDetailsLabel.backgroundColor = UIColor.white.withAlphaComponent(0.95)
        projectInDetailsLabel.layer.cornerRadius = 5
        projectInDetailsLabel.clipsToBounds = true
        
        if #available(iOS 11.0, *) {
            self.navigationItem.largeTitleDisplayMode = .never
        } else {
            // Fallback on earlier versions
        }
        
        self.tabBarController!.tabBar.tintColor = UIColor.fundBlueColor
    }
    
}
