//
//  HelpCollectionViewController.swift
//  Kids2Kids
//
//  Created by Oleksii Liubarets on 07.09.17.
//  Copyright © 2017 Oleksii Liubarets. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class HelpCollectionViewController: UICollectionViewController {
    
    var helpArray: [Help] = [Help(name: NSLocalizedString("Donate to the fund", comment: "financial help"), image: #imageLiteral(resourceName: "talkHeart"), description: NSLocalizedString("Charitable Fund «Kids to Kids» will be grateful for any help. \n\nFinancial assistance to the fund\nYou can provide by the following details: \nPrivatBank \nAccount 26000056127077 \nMFI 380775 \nEDRPO 41350891 \n\nPurpose of payment:\n«Charitable contribution»", comment: "financial help desc"), color: .fundGreenColor),
                             Help(name: NSLocalizedString("For child’s treatment", comment: "for child"), image: #imageLiteral(resourceName: "heart"), description: NSLocalizedString("Connect  monthly donation to the project HAPPINESS FOR EVERY FAMILY. \n\nTeam of charity fund «Kids to Kids» regularly receives requests for help from families with seriously ill children. \n\nHow the project works: \n1.We meet with parents of children and decide to include the family in the fund's program; \n2.We make a list and budget of monthly needs separately for each family with a seriously ill child; \n3.Regularly we finance families due to donations of fund's friends and our partners. \n\nJoin the project! Your monthly donation can help seriously ill children!", comment: "for child desc"), color: .fundRedColor),
                             Help(name: NSLocalizedString("Donate things", comment: "clothes"), image: #imageLiteral(resourceName: "star"), description: NSLocalizedString("Do you have almost new clothes, shoes, other things for children? Clean and serviceable things can still serve! \n\nChildren from orphanages and boarding schools will accept them with joy! Seeing clean, ironed and neatly stacked things in the bag, children will feel your care and will be grateful for the gift! \n\nThe most urgent needs: \n - clothes of all seasons and different sizes; \n - shoes of all seasons, purposes and sizes (slippers, sports shoes and sneakers, etc.); \n - sportswear; \n - caps, mittens, scarves; \n - bed linen, blankets, pillows; \n - means of personal hygiene; \n - pampers, disposable napkins. \n\nIf you have these treasures, bring them to us!", comment: "clothes desc"), color: .fundBlueColor),
                             Help(name: NSLocalizedString("Becomе volunteer", comment: "volunteer"), image: #imageLiteral(resourceName: "angel"), description: NSLocalizedString("Volunteers are people, without which it is difficult to imagine a completed work of the fund! \n\nHow can you help the «Kids to Kids»: \n - to purchase and deliver the needs to the orphanage, boarding schools, families; \n - help in carrying out activities; \n - to provide psychological assistance to children and parents of seriously ill children; \n - to conduct training within the program of vocational guidance (project «The Road to Life»).", comment: "volunteer desc"), color: .fundYellowColor),
                             Help(name: NSLocalizedString("Companies", comment: "companies"), image: #imageLiteral(resourceName: "cloud"), description: NSLocalizedString("We invite the companies to support our projects of assistance to orphanages, boarding schools, rehabilitation centers: \n - send children to children’s camps; \n - buy furniture; \n - pay for repairs; \n - buy household appliances.", comment: "companies desc"), color: .fundGreenColor)]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupController()
        Setup.shared.backgroundSetupOnCollectionViewController(view: self.view, collectionView: self.collectionView!)
    }
    
    func setupController() {
        navigationItem.title = NSLocalizedString("Help", comment: "help")
    }

    // MARK: UICollectionViewDataSource

    fileprivate let itemsPerRow: CGFloat = 1
    fileprivate let sectionInsets = UIEdgeInsets(top: 10.0, left: 10.0, bottom: 10.0, right: 10.0)
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return helpArray.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! HelpCollectionViewCell
    
        let help = helpArray[indexPath.row]
        cell.helpImageView.image = help.image
        cell.helpNameLabel.text = help.name
        cell.backgroundColor = help.color
        
        cell.layer.cornerRadius = 10
        cell.clipsToBounds = true
        
        return cell
    }

    // MARK: UICollectionViewDelegate

    override func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        
        let translationTransform = CATransform3DTranslate(CATransform3DIdentity, -500, 400, 0)
        cell.layer.transform = translationTransform
        UIView.animate(withDuration: 1, delay: 0.2 * Double(indexPath.row), options: .curveEaseOut, animations: {
            cell.layer.transform = CATransform3DIdentity
        })
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "HelpDetailsViewController" {
            
            if let controller = segue.destination as? HelpDetailsViewController,
                let helpModel = sender as? Help {
                
                controller.help = helpModel
            }
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let help = helpArray[indexPath.row]
        
        performSegue(withIdentifier: "HelpDetailsViewController", sender: help)
    }
}

extension HelpCollectionViewController: UICollectionViewDelegateFlowLayout {
    
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
