//
//  EventsCollectionViewController.swift
//  Kids2Kids
//
//  Created by Oleksii Liubarets on 24.09.17.
//  Copyright © 2017 Oleksii Liubarets. All rights reserved.
//

import UIKit
import Parse

private let reuseIdentifier = "Cell"

class EventsCollectionViewController: UICollectionViewController {

    // get data from parse server
    var events: [PFObject] = [] {
        didSet {
            getModelArray()
        }
    }
    
    // convert data to model
    var modelArray: [Event] = [] {
        didSet{
            stopActivityIndicator()
        }
    }
    
    // convert array to display
    var arrayCells: [Event] = [] {
        didSet {
            if let collectionView = collectionView {
                collectionView.reloadData()
            }
            UIApplication.shared.applicationIconBadgeNumber = 0
        }
    }
    
    func clearBadge() {
        let currentInstallation = PFInstallation.current()
        if let currentInstallation = currentInstallation {
            if currentInstallation.badge != 0 {
                currentInstallation.badge = 0
                currentInstallation.saveEventually()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        clearBadge()
        setup()
        fetchPost()
        startActivityIndicator()
    }
    
    func setup() {
        navigationItem.title = "Мероприятия"
        
        let background = UIImage(named: "Background")
        let imageView: UIImageView!
        imageView = UIImageView(frame: view.bounds)
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = background!
        self.collectionView?.backgroundView = imageView
    }
    
    func fetchPost() {
        let query = PFQuery(className: "Event")
        query.order(byAscending: "updatedAt")
        query.findObjectsInBackground { (objects, error) in
            if let objects = objects {
                self.events = objects
            }
        }
    }
    
    func getModelArray() {
        for event in events {
            
            let modelEvent = Event(nameOfEvent: "", dateOfEvent: "", placeOfEvent: "", descriptionOfEvent: "", imageOfEvent: #imageLiteral(resourceName: "heart"))
            
            modelEvent.nameOfEvent = event["name"] as! String
            modelEvent.dateOfEvent = event["date"] as! String
            modelEvent.placeOfEvent = event["place"] as! String
            modelEvent.descriptionOfEvent = event["description"] as! String
            let imageEventFile = event["image"] as? PFFile
            imageEventFile?.getDataInBackground(block: { (imageData, error) in
                if error == nil {
                    if let imageData = imageData {
                        let image = UIImage(data: imageData)
                        modelEvent.imageOfEvent = image!
                    }
                }
            })
            modelArray.append(modelEvent)
        }
        modelArray = modelArray.reversed()
        getEventsArray()
    }
    
    func delay(_ delay:Double, closure:@escaping ()->()) {
        let when = DispatchTime.now() + delay
        DispatchQueue.main.asyncAfter(deadline: when, execute: closure)
    }
    
    func getEventsArray() {
        var i = 0.0
        for cell in modelArray {
            delay(i, closure: {
                self.arrayCells.append(cell)
            })
            i += 0.3
        }
    }
    
    //MARK: Activity Indicator
    
    var activityIndicator = UIActivityIndicatorView()
    
    func startActivityIndicator() {
        activityIndicator.center = self.view.center
        activityIndicator.hidesWhenStopped = true
        activityIndicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.gray
        activityIndicator.color = .fundBlueColor
        
        view.addSubview(activityIndicator)
        
        activityIndicator.startAnimating()
    }
    
    func stopActivityIndicator() {
        activityIndicator.stopAnimating()
    }

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "EventDetailsViewController" {
            if let controller = segue.destination as? EventDetailsViewController,
                let eventModel = sender as? Event {
                controller.event = eventModel
            }
        }
    }

    // MARK: UICollectionViewDataSource
    
    fileprivate let itemsPerRow: CGFloat = 1
    fileprivate let sectionInsets = UIEdgeInsets(top: 10.0, left: 10.0, bottom: 10.0, right: 10.0)

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return arrayCells.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! EventCollectionViewCell
    
        let event = arrayCells[indexPath.row]
        cell.nameEventLAbel.text = event.nameOfEvent
        cell.dateEventLabel.text = event.dateOfEvent
        cell.imageEventImageView.image = event.imageOfEvent
        
        if (indexPath.row == ((self.collectionView?.numberOfItems(inSection: 0))! - 1)) {
            cell.contentView.alpha = 0
        }
        
        cell.layer.cornerRadius = 10
        cell.clipsToBounds = true
    
        return cell
    }

    override func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {

        if (indexPath.row == ((self.collectionView?.numberOfItems(inSection: 0))! - 1)) {
            UIView.animate(withDuration: 0.3, animations: {
                cell.contentView.alpha = 1.0
            })
        }
    }

    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let event = arrayCells[indexPath.row]
        
        performSegue(withIdentifier: "EventDetailsViewController", sender: event)
    }
}

extension EventsCollectionViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let paddingSpace = sectionInsets.left * (itemsPerRow + 1)
        let availableWidth = view.frame.width - paddingSpace
        let widthPerItem = availableWidth / itemsPerRow
        
        return CGSize(width: widthPerItem, height: 150)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        return sectionInsets
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        
        return sectionInsets.left
    }
}

