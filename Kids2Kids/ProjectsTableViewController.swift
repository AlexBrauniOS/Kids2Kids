//
//  ProjectsTableViewController.swift
//  Kids2Kids
//
//  Created by Oleksii Liubarets on 21.07.17.
//  Copyright © 2017 Oleksii Liubarets. All rights reserved.
//

import UIKit

class ProjectsTableViewController: UITableViewController {
    
    var projects: [Project] = [Project(projectName: "Дорога в жизнь", projectImage: #imageLiteral(resourceName: "DorogaVZhizn"), projectDescription: "Description Doroga v zhizn"),
                               Project(projectName: "Рождественский ангел", projectImage: #imageLiteral(resourceName: "RozhdestvenskiyAngel"), projectDescription: "Description Rozhdestvenskiy Angel"),
                               Project(projectName: "Открытые сердца", projectImage: #imageLiteral(resourceName: "OtkrytyeSerdca"), projectDescription: "Description Otkrytye serdca"),
                               Project(projectName: "Счастье в каждую семью", projectImage: #imageLiteral(resourceName: "SchastieVKozhnuRodynu"), projectDescription: "Description Schastie v kozhnu rodynu")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
    }
    
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return projects.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! ProjectTableViewCell

        let project = projects[indexPath.row]
        cell.projectInCellImage.image = project.projectImage
        cell.projectInCellLabel.text = project.projectName
        
        return cell
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
