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
        
        setupController()
        Setup.shared.backgroundSetupOnViewController(view: self.view)
        Setup.shared.navigationControllerSizeInIosElevenSetup(navigationItem: self.navigationItem)
        setupProject()
    }

    func setupController() {
        navigationItem.title = projects.projectName
        
        projectInDetailsLabel.backgroundColor = UIColor.white.withAlphaComponent(0.95)
        projectInDetailsLabel.layer.cornerRadius = 5
        projectInDetailsLabel.clipsToBounds = true
        projectInDetailsImageView.clipsToBounds = true
    }
    
    func setupProject() {
        projectInDetailsImageView.image = projects.projectImage
        projectInDetailsLabel.text = projects.projectDescription
    }
    
}
