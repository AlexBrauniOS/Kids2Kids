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

    @IBOutlet weak var imageEventDetailsImageView: UIImageView!
    @IBOutlet weak var dateEventDetailsLabel: UILabel!
    @IBOutlet weak var placeEventDetailsLabel: UILabel!
    @IBOutlet weak var descriptionEventDetailsTextView: UITextView!
    
    var eventsDetails: [PFObject]? {
        didSet{
            setupEvent()
        }
    }
    var nameEvent: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        fetchPost()
        
        setupController()
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
    
    func setupEvent() {
        dateEventDetailsLabel.text = eventsDetails?.first?["date"] as? String
        placeEventDetailsLabel.text = eventsDetails?.first?["place"] as? String
        descriptionEventDetailsTextView.text = eventsDetails?.first?["description"] as? String

        let imageEventDetailsFile = eventsDetails?.first?["image"] as? PFFile
        imageEventDetailsFile?.getDataInBackground(block: { (imageData, error) in
            if error == nil {
                if let imageData = imageData {
                    let image = UIImage(data: imageData)
                    self.imageEventDetailsImageView.image = image
                }
            }
        })
    }
    
    func setupController() {
        navigationItem.title = nameEvent
        self.navigationController!.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.fundBlueColor, NSFontAttributeName: UIFont(name: "Co Text Corp", size: 17)!]

        self.navigationController!.navigationBar.barTintColor = UIColor.fundGreenColor
        self.navigationController!.navigationItem.backBarButtonItem?.tintColor = UIColor.fundBlueColor
        self.tabBarController!.tabBar.barTintColor = UIColor.fundGreenColor
        self.tabBarController!.tabBar.tintColor = UIColor.fundBlueColor
    }
    
}








