//
//  HelpDetailsViewController.swift
//  Kids2Kids
//
//  Created by Oleksii Liubarets on 08.09.17.
//  Copyright © 2017 Oleksii Liubarets. All rights reserved.
//

import UIKit
import MessageUI

class HelpDetailsViewController: UIViewController {
    
    @IBOutlet weak var helpDescriptionTextView: UILabel!
    @IBOutlet weak var phoneCallButton: UIButton!
    @IBOutlet weak var emailButton: UIButton!
    
    var help: Help!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupController()
        Setup.shared.backgroundSetupOnViewController(view: self.view)
        Setup.shared.navigationControllerSizeInIosElevenSetup(navigationItem: self.navigationItem)
    }
    
    func setupController() {
        navigationItem.title = help.name
        
        helpDescriptionTextView.text = help.description
        helpDescriptionTextView.backgroundColor = UIColor.white.withAlphaComponent(0.95)
        helpDescriptionTextView.layer.cornerRadius = 5
        helpDescriptionTextView.clipsToBounds = true
        
        phoneCallButton.layer.cornerRadius = phoneCallButton.frame.height/2
        phoneCallButton.clipsToBounds = true
        emailButton.layer.cornerRadius = emailButton.frame.height/2
        emailButton.clipsToBounds = true
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
    
    // MARK: Show alert controller
    
    private func showAlertController(title: String, message: String, accessTitle: String, completion: @escaping ()->()) {
        let showAlert : UIAlertController = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        showAlert.addAction(UIAlertAction(title: NSLocalizedString("Отмена", comment: "cancel"), style: UIAlertActionStyle.cancel, handler: nil))
        showAlert.addAction(UIAlertAction(title: accessTitle, style: UIAlertActionStyle.default, handler: { action in completion()}))
        self.present(showAlert, animated: true, completion: nil)
    }
    
    @IBAction func phoneCallButtonPressed(_ sender: UIButton) {
        showAlertController(title: NSLocalizedString("Позвонить в Фонд ДетиДетям?", comment: "call to fund"), message: "+38 (050) 471-30-30", accessTitle: NSLocalizedString("Позвонить", comment: "call")) {
            self.callNumber(phoneNumber: "+380504713030")
        }
    }
    @IBAction func emailButtonPressed(_ sender: UIButton) {
        sendEmail()
    }
    
}

extension HelpDetailsViewController: MFMailComposeViewControllerDelegate {
    
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
