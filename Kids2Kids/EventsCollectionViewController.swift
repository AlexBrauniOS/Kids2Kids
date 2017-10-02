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

    var events: [PFObject] = [] {
        didSet {
            getEventsArray()
            stopActivityIndicator()
        }
    }
    var arrayCells: [PFObject] = [] {
        didSet {
            
            if let collectionView = collectionView {
                collectionView.reloadData()
            }
        }
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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        fetchPost()
        setup()
        startActivityIndicator()
    }
    
    func delay(_ delay:Double, closure:@escaping ()->()) {
        let when = DispatchTime.now() + delay
        DispatchQueue.main.asyncAfter(deadline: when, execute: closure)
    }
    
    func getEventsArray() {
        var i = 0.0
        for cell in events {
            delay(i, closure: {
                self.arrayCells.append(cell)
            })
            i += 0.2
        }
    }
    
    func setup() {
        navigationItem.title = "Мероприятия"
        self.navigationController!.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.fundBlueColor, NSFontAttributeName: UIFont(name: "Co Text Corp", size: 19)!]
        
        let background = UIImage(named: "Background")
        let imageView: UIImageView!
        imageView = UIImageView(frame: view.bounds)
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = background!
        self.collectionView?.backgroundView = imageView
        
        self.navigationController!.navigationBar.tintColor = UIColor.fundBlueColor
        self.navigationController!.navigationItem.backBarButtonItem?.tintColor = UIColor.fundBlueColor
        self.tabBarController!.tabBar.tintColor = UIColor.fundBlueColor
    }
    
    func fetchPost() {
        let query = PFQuery(className: "Event")
        query.findObjectsInBackground { (objects, error) in
            if let objects = objects {
                self.events = objects
//                self.collectionView?.reloadData()
            }
        }
    }

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "EventDetailsViewController" {
            if let controller = segue.destination as? EventDetailsViewController,
                let name = sender as? String {
                controller.nameEvent = name
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
        cell.nameEventLAbel.text = event["name"] as? String
        cell.dateEventLabel.text = event["date"] as? String
        let imageEventFile = event["image"] as? PFFile
        imageEventFile?.getDataInBackground(block: { (imageData, error) in
            if error == nil {
                if let imageData = imageData {
                    let image = UIImage(data: imageData)
                    cell.imageEventImageView.image = image
                }
            }
        })
        
        if (indexPath.row == ((self.collectionView?.numberOfItems(inSection: 0))! - 1)) {
            cell.contentView.alpha = 0
        }
        
        cell.layer.cornerRadius = 10
        cell.clipsToBounds = true
    
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        
        if (indexPath.row == ((self.collectionView?.numberOfItems(inSection: 0))! - 1)) {
            UIView.animate(withDuration: 0.2, animations: {
                cell.contentView.alpha = 1.0
            })
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let event = events[indexPath.row]
        let name = event["name"] as? String
        performSegue(withIdentifier: "EventDetailsViewController", sender: name)
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

