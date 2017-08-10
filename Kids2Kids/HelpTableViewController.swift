//
//  TableViewController.swift
//  Kids2Kids
//
//  Created by Oleksii Liubarets on 09.08.17.
//  Copyright © 2017 Oleksii Liubarets. All rights reserved.
//

import UIKit
import MessageUI

class HelpTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        checkAvailableMailServices()
        setup()
    }
    
    func setup() {
        
        self.navigationItem.title = "Помощь"
        self.navigationController!.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.fundBlueColor, NSFontAttributeName: UIFont(name: "Co Text Corp", size: 19)!]
        
        let background = UIImage(named: "Background")
        let imageView: UIImageView!
        imageView = UIImageView(frame: view.bounds)
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = background!
        self.tableView.backgroundView = imageView
    }
    
    private func callNumber(phoneNumber: String) {
        
        if let phoneCallURL = URL(string: "tel://\(phoneNumber)") {
            
            let application:UIApplication = UIApplication.shared
            if (application.canOpenURL(phoneCallURL)) {
                application.open(phoneCallURL, options: [:], completionHandler: nil)
            }
        }
    }
    
    private func showAlertController(title: String, message: String, accessTitle: String, completion: @escaping ()->()) {
        let showAlert : UIAlertController = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        showAlert.addAction(UIAlertAction(title: "Отмена", style: UIAlertActionStyle.cancel, handler: nil))
        showAlert.addAction(UIAlertAction(title: accessTitle, style: UIAlertActionStyle.default, handler: { action in completion()}))
        self.present(showAlert, animated: true, completion: nil)
    }

    
    @IBAction func phoneCall(_ sender: UIButton) {
        showAlertController(title: "Позвонить в Фонд ДетиДетям?", message: "+38 (050) 471-30-30", accessTitle: "Позвонить") {
            self.callNumber(phoneNumber: "+380504713030")
        }
    }
    
    @IBAction func email(_ sender: UIButton) {
        sendEmail()
    }
    
    
}

extension HelpTableViewController: MFMailComposeViewControllerDelegate {
    
    // MARK: Mail Services
    
    func checkAvailableMailServices() {
        if !MFMailComposeViewController.canSendMail() {
            print("Mail services are not available")
            return
        }
    }
    
    func sendEmail() {
        let composeVC = MFMailComposeViewController()
        composeVC.mailComposeDelegate = self
        // Configure the fields of the interface.
        composeVC.setToRecipients(["web@kids2kids-fund.com"])
        //        composeVC.setSubject("")
        //        composeVC.setMessageBody("", isHTML: false)
        // Present the view controller modally.
        self.present(composeVC, animated: true, completion: nil)
    }
    
    func mailComposeController(_ controller: MFMailComposeViewController,
                               didFinishWith result: MFMailComposeResult,
                               error: Error?) {
        // Check the result or perform other tasks.
        // Dismiss the mail compose view controller.
        controller.dismiss(animated: true, completion: nil)
    }
}

