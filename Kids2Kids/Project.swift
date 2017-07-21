//
//  Projects.swift
//  Kids2Kids
//
//  Created by Oleksii Liubarets on 21.07.17.
//  Copyright © 2017 Oleksii Liubarets. All rights reserved.
//

import Foundation
import UIKit

class Project {
    
    let projectName: String
    let projectImage: UIImage
    let projectDescription: String
    init(projectName: String, projectImage: UIImage, projectDescription: String){
        self.projectName = projectName
        self.projectImage = projectImage
        self.projectDescription = projectDescription
    }
}
