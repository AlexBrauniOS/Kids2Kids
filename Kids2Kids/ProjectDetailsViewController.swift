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
        setup()
        setupBG()
    }
    
    func setupBG() {
        let background = UIImage(named: "Background")
        self.view.clipsToBounds = true
        self.view.contentMode = UIViewContentMode.scaleAspectFill
        self.view.backgroundColor = UIColor(patternImage: background!)
    }

    func setup() {
        navigationItem.title = projects.projectName
        projectInDetailsImageView.image = projects.projectImage
        projectInDetailsLabel.text = projects.projectDescription
        projectInDetailsLabel.backgroundColor = UIColor.white.withAlphaComponent(0.9)
        projectInDetailsLabel.layer.cornerRadius = 5
        projectInDetailsLabel.clipsToBounds = true
        
        
        
        
        self.tabBarController!.tabBar.tintColor = UIColor.fundBlueColor
    }
    
}
