//
//  EventDetailsTableViewController.swift
//  
//
//  Created by Oleksii Liubarets on 25.07.17.
//
//

import UIKit
import Parse

class EventDetailsTableViewController: UITableViewController {


    @IBOutlet weak var nameEventDetailsLabel: UILabel!
    @IBOutlet weak var imageEventDetailsImageView: UIImageView!
    @IBOutlet weak var dateEventDetailsLabel: UILabel!
    @IBOutlet weak var placeEventDetailsLabel: UILabel!
    @IBOutlet weak var descriptionEventDetailsTextView: UITextView!
    
    var eventsDetails = [PFObject]()
    var nameEvent: String? {
        didSet{
//            setup()
            print(nameEvent!)
         

        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    
    
    func setup() {
        
//        let eventDetails = eventsDetails
        nameEventDetailsLabel.text = nameEvent
//        dateEventDetailsLabel.text = eventDetails["date"] as? String
//        let imageEventDetailsFile = eventDetails["image"] as? PFFile
//        imageEventDetailsFile?.getDataInBackground(block: { (imageData, error) in
//            if error == nil {
//                if let imageData = imageData {
//                    let image = UIImage(data: imageData)
//                    self.imageEventDetailsImageView.image = image
//                }
//            }
//        })
    }
}
