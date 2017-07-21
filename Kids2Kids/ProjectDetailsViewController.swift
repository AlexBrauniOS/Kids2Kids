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
    @IBOutlet weak var projectInDetailsTextView: UITextView!

    var projects: Project!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    func setup() {
        navigationItem.title = projects.projectName
        projectInDetailsImageView.image = projects.projectImage
        projectInDetailsTextView.text = projects.projectDescription
    }
}
