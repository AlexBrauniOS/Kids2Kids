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
    
    // funcs for contacts button with allertController
    private func callNumber(phoneNumber: String) {
        
        if let phoneCallURL = URL(string: "tel://\(phoneNumber)") {
            
            let application:UIApplication = UIApplication.shared
            if (application.canOpenURL(phoneCallURL)) {
                application.open(phoneCallURL, options: [:], completionHandler: nil)
            }
        }
    }
    
    private func openWebsite() {
        let url = URL(string: "http://www.stackoverflow.com")
        UIApplication.shared.open(url!, options: [:], completionHandler: nil)
    }
    
    private func openFacebookPage() {
        let facebookUID = "kids2kidsfund"
        
        print(facebookUID)
        let fbURLWeb: NSURL = NSURL(string: "https://www.facebook.com/\(facebookUID)")!
        let fbURLID: NSURL = NSURL(string: "fb://profile/\(facebookUID)")!
        
        if(UIApplication.shared.canOpenURL(fbURLID as URL)){
            // FB installed
            UIApplication.shared.open(fbURLID as URL, options: [:], completionHandler: nil)
            //(fbURLID as URL)
        } else {
            // FB is not installed, open in safari
            UIApplication.shared.open(fbURLWeb as URL, options: [:], completionHandler: nil)
        }
    }
    
    private func showAlertController(title: String, message: String, accessTitle: String, completion: @escaping ()->()) {
        let showAlert : UIAlertController = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        showAlert.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel, handler: nil))
        showAlert.addAction(UIAlertAction(title: accessTitle, style: UIAlertActionStyle.default, handler: { action in completion()}))
        self.present(showAlert, animated: true, completion: nil)
    }

    
    @IBAction func webSiteButton(_ sender: UIButton) {
        showAlertController(title: "Open Kids2Kids website", message: "Are you sure, that you want to open Safari?", accessTitle: "Open") {
            self.openWebsite()
        }
    }
    @IBAction func emailButton(_ sender: UIButton) {
        showAlertController(title: "Sending e-mail to Kids2Kids", message: "Are you sure, that you want to send email?", accessTitle: "Send") {
            self.sendEmail()
        }
    }
    @IBAction func phoneButton(_ sender: UIButton) {
        showAlertController(title: "Calling to Kids2Kids", message: "+38 (050) 471-30-30", accessTitle: "Call") {
            self.callNumber(phoneNumber: "+380504745993")
        }
    }
    @IBAction func facebookButton(_ sender: UIButton) {
        showAlertController(title: "Open Facebook?", message: "Facebook Page @kids2kidsfund", accessTitle: "Open") {
            self.openFacebookPage()
        }
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
