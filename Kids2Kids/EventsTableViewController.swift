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
    
    var events = [PFObject]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchPost()
        setup()
    }
    
    func setup() {
        navigationItem.title = "Мероприятия"
        self.navigationController!.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.fundBlueColor, NSFontAttributeName: UIFont(name: "Co Text Corp", size: 22)!]
        
        self.navigationController!.navigationBar.barTintColor = UIColor.fundGreenColor
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
        return events.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "EventCell", for: indexPath) as! EventTableViewCell

        let event = events[indexPath.row]
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
        
        return cell
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
