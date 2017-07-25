//
//  EventTableViewCell.swift
//  Kids2Kids
//
//  Created by Oleksii Liubarets on 25.07.17.
//  Copyright © 2017 Oleksii Liubarets. All rights reserved.
//

import UIKit

class EventTableViewCell: UITableViewCell {

    @IBOutlet weak var nameEventLAbel: UILabel!
    @IBOutlet weak var dateEventLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
