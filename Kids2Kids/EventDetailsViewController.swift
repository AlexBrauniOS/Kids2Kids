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
    @IBOutlet weak var descriptionEventDetailsLabel: UILabel!
    @IBOutlet weak var labelBGView: UIView!
    
    var eventsDetails: [PFObject]? {
        didSet{
            stopActivityIndicator()
            setupEvent()
        }
    }
    var nameEvent: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        startActivityIndicator()
        fetchPost()
        setupController()
        setupBG()
    }
    
    var activityIndicator = UIActivityIndicatorView()
    
    func startActivityIndicator() {
        activityIndicator.center = self.view.center
        activityIndicator.hidesWhenStopped = true
        activityIndicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.gray
        view.addSubview(activityIndicator)
        
        activityIndicator.startAnimating()
    }
    
    func stopActivityIndicator() {
        activityIndicator.stopAnimating()
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
        descriptionEventDetailsLabel.text = eventsDetails?.first?["description"] as? String

        let imageEventDetailsFile = eventsDetails?.first?["image"] as? PFFile
        imageEventDetailsFile?.getDataInBackground(block: { (imageData, error) in
            if error == nil {
                if let imageData = imageData {
                    let image = UIImage(data: imageData)
                    self.imageEventDetailsImageView.image = image
                }
            }
        })
        
        labelBGView.backgroundColor = UIColor.white.withAlphaComponent(0.95)
        labelBGView.layer.cornerRadius = 5
        labelBGView.clipsToBounds = true
        descriptionEventDetailsLabel.backgroundColor = UIColor.white.withAlphaComponent(0.95)
        descriptionEventDetailsLabel.layer.cornerRadius = 5
        descriptionEventDetailsLabel.clipsToBounds = true
    }
    
    func setupController() {
        navigationItem.title = nameEvent
        self.navigationController!.navigationItem.backBarButtonItem?.tintColor = UIColor.fundBlueColor
        self.tabBarController!.tabBar.tintColor = UIColor.fundBlueColor

    }
    
    func setupBG() {
        let background = UIImage(named: "Background")
        self.view.clipsToBounds = true
        self.view.contentMode = UIViewContentMode.scaleAspectFill
        self.view.backgroundColor = UIColor(patternImage: background!)
    }
    
}








