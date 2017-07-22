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
        let myBlueColor = UIColor(red: 0.0/255.0, green: 117.0/255.0, blue: 201.0/255.0, alpha: 1.0)
        self.navigationController!.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: myBlueColor, NSFontAttributeName: UIFont(name: "Co Text Corp", size: 17)!]
        projectInDetailsImageView.image = projects.projectImage
        projectInDetailsTextView.text = projects.projectDescription
    }
}
