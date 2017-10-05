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
    
    var event: Event!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupController()
        setupBG()
        setupEvent()
    }
    
    func setupEvent() {
        dateEventDetailsLabel.text = event.nameOfEvent
        placeEventDetailsLabel.text = event.placeOfEvent
        descriptionEventDetailsLabel.text = event.descriptionOfEvent
        imageEventDetailsImageView.image = event.imageOfEvent
        
        labelBGView.backgroundColor = UIColor.white.withAlphaComponent(0.95)
        labelBGView.layer.cornerRadius = 5
        labelBGView.clipsToBounds = true
        descriptionEventDetailsLabel.backgroundColor = UIColor.white.withAlphaComponent(0.95)
        descriptionEventDetailsLabel.layer.cornerRadius = 5
        descriptionEventDetailsLabel.clipsToBounds = true
    }
    
    func setupController() {
        navigationItem.title = event.nameOfEvent

        if #available(iOS 11.0, *) {
            self.navigationItem.largeTitleDisplayMode = .never
        } else {
            // Fallback on earlier versions
        }
    }
    
    func setupBG() {
        let background = UIImageView(frame: UIScreen.main.bounds)
        background.image = UIImage(named: "Background")
        background.contentMode = .scaleAspectFill
        self.view.insertSubview(background, at: 0)
    }
    
}








