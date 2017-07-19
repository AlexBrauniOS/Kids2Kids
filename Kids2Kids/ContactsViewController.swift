//
//  ContactsViewController.swift
//  Kids2Kids
//
//  Created by Oleksii Liubarets on 18.07.17.
//  Copyright © 2017 Oleksii Liubarets. All rights reserved.
//

import Foundation
import UIKit
import MessageUI

class ContactsViewController: UIViewController {
    
    @IBOutlet weak var logoImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if !MFMailComposeViewController.canSendMail() {
            print("Mail services are not available")
            return
        }
    }
    
    func showAlertController(allertTitle: String, allertMessage: String) {
        let showAlert : UIAlertController = UIAlertController(title: allertTitle, message: allertMessage, preferredStyle: UIAlertControllerStyle.alert)
        showAlert.addAction(UIAlertAction(title: "No", style: UIAlertActionStyle.cancel, handler: nil))
        showAlert.addAction(UIAlertAction(title: "Yes", style: UIAlertActionStyle.default, handler: nil))
        self.present(showAlert, animated: true, completion: nil)
    }
    
    
    @IBAction func webSiteButton(_ sender: UIButton) {
        let websiteAlertTitle = "Transition to website"
        let websiteAlertMessage = "Are you sure, that you want to visit this website?"
        showAlertController(allertTitle: websiteAlertTitle, allertMessage: websiteAlertMessage)
    }
    @IBAction func emailButton(_ sender: UIButton) {
        func showAlertController() {
            let showAlert : UIAlertController = UIAlertController(title: "Transition to Mail App", message: "Are you sure, that you want to send email?", preferredStyle: UIAlertControllerStyle.alert)
            showAlert.addAction(UIAlertAction(title: "No", style: UIAlertActionStyle.cancel, handler: nil))
            showAlert.addAction(UIAlertAction(title: "Yes", style: UIAlertActionStyle.default, handler: { action in self.sendEmail()}))
            self.present(showAlert, animated: true, completion: nil)
        }
        showAlertController()
    }
    @IBAction func phoneButton(_ sender: UIButton) {
        let phoneAlertTitle = "Phone call"
        let phoneAlertMessage = "Are you sure, that you want to call to Kids2Kids?"
        showAlertController(allertTitle: phoneAlertTitle, allertMessage: phoneAlertMessage)
    }
    @IBAction func facebookButton(_ sender: UIButton) {
    }

}

extension ContactsViewController: MFMailComposeViewControllerDelegate {
    
    func sendEmail() {
        let composeVC = MFMailComposeViewController()
        composeVC.mailComposeDelegate = self
        // Configure the fields of the interface.
        composeVC.setToRecipients(["lubaretsaa@gmail.com"])
        composeVC.setSubject("Test")
        composeVC.setMessageBody("Hello! It's test mail from iOS app 'Kids2Kids'. Sincirely yours, Alex Braun.", isHTML: false)
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
