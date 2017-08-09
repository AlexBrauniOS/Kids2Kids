//
//  EventsTableViewController.swift
//  Kids2Kids
//
//  Created by Oleksii Liubarets on 24.07.17.
//  Copyright © 2017 Oleksii Liubarets. All rights reserved.
//

import UIKit
import Parse

class EventsTableViewController: UITableViewController {
    
    var events = [PFObject]() {
        didSet {
            getEventsArray()
            stopActivityIndicator()
        }
    }
    var arrayCells: [PFObject] = [] {
        didSet {
            tableView.reloadData()
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
        self.tableView.backgroundView = imageView
        
        self.navigationController!.navigationBar.tintColor = UIColor.fundBlueColor
        self.navigationController!.navigationItem.backBarButtonItem?.tintColor = UIColor.fundBlueColor
        self.tabBarController!.tabBar.tintColor = UIColor.fundBlueColor
    }
    
    func fetchPost() {
        let query = PFQuery(className: "Event")
        query.findObjectsInBackground { (objects, error) in
            if let objects = objects {
                self.events = objects
                self.tableView.reloadData()
            }
        }
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayCells.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "EventCell", for: indexPath) as! EventTableViewCell

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
        
        if (indexPath.row == (self.tableView.numberOfRows(inSection: 0) - 1)) {
            cell.contentView.alpha = 0
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        if (indexPath.row == (self.tableView.numberOfRows(inSection: 0) - 1)) {
            UIView.animate(withDuration: 0.2, animations: {
                cell.contentView.alpha = 1.0
            })
        }
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let event = events[indexPath.row]
        let name = event["name"] as? String
        performSegue(withIdentifier: "EventDetailsTableViewController", sender: name)
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "EventDetailsTableViewController" {
            if let controller = segue.destination as? EventDetailsViewController,
                let name = sender as? String {
                controller.nameEvent = name
            }
        }
    }
}



