//
//  ProjectCollectionViewCell.swift
//  Kids2Kids
//
//  Created by Oleksii Liubarets on 23.09.17.
//  Copyright © 2017 Oleksii Liubarets. All rights reserved.
//

import UIKit

class ProjectCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var projectInCellImage: UIImageView!
    @IBOutlet weak var projectInCellLabel: UILabel!
    @IBOutlet weak var projectInCellIcon: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
        
    }
    
    func setup() {
        projectInCellLabel.font = UIFont(name: "Co Text Corp", size: 18.0)
    }
    
}
