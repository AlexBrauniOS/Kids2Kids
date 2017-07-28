//
//  EDViewController.swift
//  Kids2Kids
//
//  Created by Oleksii Liubarets on 26.07.17.
//  Copyright © 2017 Oleksii Liubarets. All rights reserved.
//

import UIKit
import Parse

class EventDetailsViewController: UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var imageEventDetailsImageView: UIImageView!
    @IBOutlet weak var dateEventDetailsLabel: UILabel!
    @IBOutlet weak var placeEventDetailsLabel: UILabel!
    @IBOutlet weak var descriptionEventDetailsTextView: UITextView!
   
    var eventsDetails: [PFObject]? {
        didSet{
            setup()
        }
    }
    var nameEvent: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = nameEvent
        
        fetchPost()
    }
    
    func fetchPost() {
        let query = PFQuery(className: "Event")
        query.whereKey("name", equalTo: nameEvent)
        query.findObjectsInBackground { (objects, error) in
            if let objects = objects {
                self.eventsDetails = objects
            
            }
        }
    }
    
    func setup() {
        nameLabel.text = nameEvent
//        let event = eventsDetails
//        dateEventDetailsLabel.text = event["date"] as? String
//        print(event)
    }

}








