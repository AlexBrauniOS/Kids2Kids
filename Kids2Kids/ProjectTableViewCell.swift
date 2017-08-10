//
//  ProjectTableViewCell.swift
//  Kids2Kids
//
//  Created by Oleksii Liubarets on 21.07.17.
//  Copyright © 2017 Oleksii Liubarets. All rights reserved.
//

import UIKit

class ProjectTableViewCell: UITableViewCell {

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

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
