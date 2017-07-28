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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        checkAvailableMailServices()
    }
    
    // MARK: Call number
    
    private func callNumber(phoneNumber: String) {
        
        if let phoneCallURL = URL(string: "tel://\(phoneNumber)") {
            
            let application:UIApplication = UIApplication.shared
            if (application.canOpenURL(phoneCallURL)) {
                application.open(phoneCallURL, options: [:], completionHandler: nil)
            }
        }
    }
    
    // MARK: Website
    
    private func openWebsite() {
        let url = URL(string: "http://www.kids2kids-fund.com")
        UIApplication.shared.open(url!, options: [:], completionHandler: nil)
    }
    
    // MARK: Facebook
    
    private func openFacebookPage() {
        let facebookUID = "kids2kidsfund"
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
    
    // MARK: Show alert controller
    
    private func showAlertController(title: String, message: String, accessTitle: String, completion: @escaping ()->()) {
        let showAlert : UIAlertController = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        showAlert.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel, handler: nil))
        showAlert.addAction(UIAlertAction(title: accessTitle, style: UIAlertActionStyle.default, handler: { action in completion()}))
        self.present(showAlert, animated: true, completion: nil)
    }

    // MARK: Contact buttons
    
    @IBAction func webSiteButton(_ sender: UIButton) {
        openWebsite()
    }
    @IBAction func emailButton(_ sender: UIButton) {
            sendEmail()
    }
    @IBAction func phoneButton(_ sender: UIButton) {
        showAlertController(title: "Calling to Kids2Kids-Fund", message: "+38 (050) 471-30-30", accessTitle: "Call") {
            self.callNumber(phoneNumber: "+380504713030")
        }
    }
    @IBAction func facebookButton(_ sender: UIButton) {
        openFacebookPage()
    }
    
    // MARK: Hide controller button
    
    @IBAction func hideContactPageButton(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }

}

extension ContactsViewController: MFMailComposeViewControllerDelegate {
    
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
