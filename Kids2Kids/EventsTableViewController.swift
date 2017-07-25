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

//    var events: [Event] = [Event(nameOfEvent: "Фотопроект 'Мы живы'", imageOfEvent: #imageLiteral(resourceName: "RozhdestvenskiyAngel"), dateOfEvent: "29 июля - 8 августа", placeOfEvent: "Киев, ул.Набережно-Луговая, 8", descriptionOfEvent: "Тем временем боевые действия не прекращаются уже четвертый год, а детство этих подростков и других детей расстреливают прицельным огнем из разных видов оружия. «В прифронтовом Марьинском районе очень много талантливых детей и они не могут выехать, так как их родителей никто и нигде не ждет. Вообще, людям трудно покидать свои дома и ехать неизвестно куда» - рассказывает Олег Ткаченко, создатель и руководитель молодежного медиа-центра в Марьинке. Медиа-центр был создан для того, чтобы хоть как-то поддержать детей и дать им возможность самовыражаться посредством фотографии. В течении выставки у посетителей будет возможность предоставить финансовую поддержку медиа центру, которая будет направлена на покупку необходимой фототехники или передать б/у технику в пользование студентам. Таким образом, мы дадим шанс большему количеству детей изучить новый навык, который для некоторых из них может стать делом жизни. На выставке будет представлена инсталляция Киевской Арт Группы CoolArt - размышление на тему нашего восприятия жизни в прифронтовой зоне. Арт-группа CoolArt (Ольга Гурина и Олег Кулай-Кулайчук, Киев) в своих работах художники придают особое значение высказыванию и нарративу, в основе которого лежит сюжетный образ, контекст и субъективность восприятия зрителя. Выставка доступна для свободного посещения: 29 июля с 16:00 - 20:00, 30 июля по 08 августа с 12:00 - 20:00")]
    
    var events = [PFObject]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchPost()
    }
    
    func fetchPost() {
        let query = PFQuery(className: "Event")
        //        query.whereKey("text", hasSuffix: "t2")
        query.findObjectsInBackground { (objects, error) in
            if let objects = objects {
                self.events = objects
                
                print(objects)
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

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
