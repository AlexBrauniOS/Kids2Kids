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
    
    var helpArray: [Help] = [Help(name: "Финансовая помощь", image: #imageLiteral(resourceName: "talkHeart"), description: "Вы можете оказать финансовую помощь по следующим реквизитам: ", color: .fundGreenColor),
                             Help(name: "Конкретному ребёнку", image: #imageLiteral(resourceName: "heart"), description: "Помогать конкретному ребёнку можно, подключив ежемесячное пожертвование в рамках проекта Щастя в кожну родину", color: .fundRedColor),
                             Help(name: "Передать вещи", image: #imageLiteral(resourceName: "star"), description: "У Вас остались почти новые обувь и вещи? Дети из детских домов и школ-интернатов примут их с радостью.", color: .fundBlueColor),
                             Help(name: "Стать волонтёром", image: #imageLiteral(resourceName: "angel"), description: "Помогать в проведении мероприятий, участвовать в программе профориентации будущих выпускников.", color: .fundYellowColor),
                             Help(name: "Организациям", image: #imageLiteral(resourceName: "cloud"), description: "Предлагаем компаниям поддержать наши проекты помощь детдомам, школам-интернатам, реабилитационным центрам.", color: .fundGreenColor)]
    
    var array: [Help] = [] {
        didSet {
            collectionView!.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
        getHelpArray()
        
    }
    
    func delay(_ delay:Double, closure:@escaping ()->()) {
        let when = DispatchTime.now() + delay
        DispatchQueue.main.asyncAfter(deadline: when, execute: closure)
    }
    
    func getHelpArray() {
        var i = 0.0
        for help in helpArray {
            delay(i, closure: {
                self.array.append(help)
            })
            i += 0.2
        }
    }
    
    func setup() {
        
        navigationItem.title = "Помощь"
        self.navigationController!.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.fundBlueColor, NSFontAttributeName: UIFont(name: "Co Text Corp", size: 19)!]
        
        let background = UIImage(named: "Background")
        let imageView: UIImageView!
        imageView = UIImageView(frame: view.bounds)
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = background!
        self.collectionView?.backgroundView = imageView
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    fileprivate let itemsPerRow: CGFloat = 1
    fileprivate let sectionInsets = UIEdgeInsets(top: 10.0, left: 10.0, bottom: 10.0, right: 10.0)
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return array.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! HelpCollectionViewCell
    
        let help = array[indexPath.row]
        cell.helpImageView.image = help.image
        cell.helpNameLabel.text = help.name
        cell.backgroundColor = help.color
        
        cell.layer.cornerRadius = 10
        cell.clipsToBounds = true
        cell.helpNameLabel.textColor = .white
        cell.helpNameLabel.font = cell.helpNameLabel.font.withSize(20)
        
        return cell
    }

    // MARK: UICollectionViewDelegate

    override func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if (indexPath.row == ((self.collectionView?.numberOfItems(inSection: 0))! - 1)) {
            UIView.animate(withDuration: 0.2, animations: {
                cell.contentView.alpha = 1.0
            })
        }
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
        let help = array[indexPath.row]
        
        performSegue(withIdentifier: "HelpDetailsViewController", sender: help)
    }
    
    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

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
