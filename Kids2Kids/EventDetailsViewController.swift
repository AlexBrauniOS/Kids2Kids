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
        setupBG()
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

        self.navigationController!.navigationItem.backBarButtonItem?.tintColor = UIColor.fundBlueColor
        self.tabBarController!.tabBar.tintColor = UIColor.fundBlueColor
        
        descriptionEventDetailsTextView.backgroundColor = UIColor.white.withAlphaComponent(0.9)
    }
    
    func setupBG() {
        let background = UIImage(named: "Background")
        self.view.clipsToBounds = true
        self.view.contentMode = UIViewContentMode.scaleAspectFill
        self.view.backgroundColor = UIColor(patternImage: background!)
    }
    
}








