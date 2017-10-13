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
    @IBOutlet weak var addToEventButton: UIButton!
    
    var event: Event!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupController()
        Setup.shared.backgroundSetupOnViewController(view: self.view)
        Setup.shared.navigationControllerSizeInIosElevenSetup(navigationItem: self.navigationItem)
        setupEvent()
    }
    
    func setupController() {
        navigationItem.title = event.nameOfEvent
        
        addToEventButton.backgroundColor = UIColor.fundGreenColor
        addToEventButton.layer.cornerRadius = 10
        addToEventButton.clipsToBounds = true
        
        labelBGView.backgroundColor = UIColor.white.withAlphaComponent(0.95)
        labelBGView.layer.cornerRadius = 5
        labelBGView.clipsToBounds = true
        descriptionEventDetailsLabel.backgroundColor = UIColor.white.withAlphaComponent(0.95)
        descriptionEventDetailsLabel.layer.cornerRadius = 5
        descriptionEventDetailsLabel.clipsToBounds = true
        imageEventDetailsImageView.clipsToBounds = true
    }
    
    func setupEvent() {
        dateEventDetailsLabel.text = event.dateOfEvent
        placeEventDetailsLabel.text = event.placeOfEvent
        descriptionEventDetailsLabel.text = event.descriptionOfEvent
        imageEventDetailsImageView.image = event.imageOfEvent
    }
    
    private func openFacebookPage(fblink: String) {
        let facebookUID = fblink
        let fbURLWeb = NSURL(string: "https://www.facebook.com/events/\(facebookUID)")!
        let fbURLID = NSURL(string: "fb://event?id=\(facebookUID)")!
        
        if UIApplication.shared.canOpenURL(fbURLID as URL) {
            // FB installed
            UIApplication.shared.open(fbURLID as URL)
        } else {
            // FB is not installed, open in safari
            UIApplication.shared.open(fbURLWeb as URL)
        }
    }
    
    @IBAction func addToEventButtonPressed(_ sender: UIButton) {
        openFacebookPage(fblink: event.fblinkOfEvent)
    }
}








