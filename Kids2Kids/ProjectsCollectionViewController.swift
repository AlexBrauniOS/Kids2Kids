//
//  ProjectsCollectionViewController.swift
//  Kids2Kids
//
//  Created by Oleksii Liubarets on 23.09.17.
//  Copyright © 2017 Oleksii Liubarets. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class ProjectsCollectionViewController: UICollectionViewController {

    let projects: [Project] = [Project(projectName: NSLocalizedString("Road to life", comment: "road to life"), projectImage: #imageLiteral(resourceName: "DorogaVZhizn"), projectIcon: #imageLiteral(resourceName: "sun"), projectDescription: NSLocalizedString("«Road to life» is a charitable project in support of graduates of orphanages in Ukraine. \n\nGraduation is the most important time for children. Throughout the year, our project strives to prepare children for graduation period psychologically, spiritually and practically.  Fund organizes seminars and career orientation programs with support of representatives of different types of applied professions. \n\nThe final stage of the project is the annual charity event “Road to Life”. Partners of the project collect bags with everything necessary and useful for graduates in their independent life. Everyone who want to participate in the project can apply to us and the fund team will send a letter from a particular graduate, where he or she describe their desires and goals in life. Thanks to such personal participation, a connection is formed with the child whom we are helping and sincerely wish success in his adult life. Many of our partners not only prepare bags, but also write back letters with important advice, some of them also provide assistance in finding a job and housing graduates in a new city. \n\nIn 2017, the project covered 86 children from 9 orphanages and boarding schools in Ukraine. Thanks to our guests, they received not only the most necessary things for independent living, but also beautiful prom dresses, shirts, ties and shoes.", comment: "road to life desc")),
                               Project(projectName: NSLocalizedString("Christmas angel", comment: "christmas angel"), projectImage: #imageLiteral(resourceName: "RozhdestvenskiyAngel"), projectIcon: #imageLiteral(resourceName: "angel"), projectDescription: NSLocalizedString("«Christmas angel» is an annual charity event that unites hundreds of families on the eve of the New Year and gives them the opportunity to start the next year from giving joy to orphans and families in need. \n\nEvery year, by Christmas, we receive hundreds of letters from children from orphanages and rehabilitation centers, in which they share their cherished desires. \n\nThese desires are fulfilled by the “Christmas angels” – the partners of the project together with their children. They not only give gifts, which children dreamed of all year, but also write back letters. This makes it possible for a child in an orphanage to believe in a miracle – that there is a God and His Angels who hear his requests and always fulfill them, only need to believe. \n\nIt also enables the child from a full-fledged family to show compassion and extend a helping hand to another child who has already experienced what it means to live in this world without parents.", comment: "christmas angel desc")),
                               Project(projectName: NSLocalizedString("Open hearts", comment: "open heart"), projectImage: #imageLiteral(resourceName: "OtkrytyeSerdca"), projectIcon: #imageLiteral(resourceName: "talkHeart"), projectDescription: NSLocalizedString("«Open hearts» is an annual charitable event of the Children’s Children Foundation, aimed at raising funds for the specific needs of children from orphanages and rehabilitation centers. As part of the event, we also raise funds for the treatment of seriously ill children who need emergency care. \n\nChildren who come with their parents to this charity event make their own hand-made hearts and send them to children from orphanages. Hundreds of hearts from ceramics, fabrics, plaster, paper, painted with colors and crayons are sent with love to different parts of Ukraine. In turn, children from orphanages send their gifts back to make this symbolic exchange. \n\nThe “Open hearts” project unites hundreds of children throughout Ukraine, thus showing how important it is to open our hearts to each other.", comment: "open heart desc")),
                               Project(projectName: NSLocalizedString("Happiness for every family", comment: "happiness in every family"), projectImage: #imageLiteral(resourceName: "SchastieVKozhnuRodynu"), projectIcon: #imageLiteral(resourceName: "star"), projectDescription: NSLocalizedString("«Happiness for every family» — the project of our foundation, which started in 2015 from several families and is now expanding every day. \n\nThe project is a targeted assistance to families with children bedridden with terrible ailments. \n\nEvery month we come to these families and bring medicines, diapers and other necessary things thanks to financial support of our donors and partners. Such help for families is a very big support and most importantly – understanding of the fact that this world has not turned away from them. That there are people who are ready  to make their contribution to share the burden that has fallen on the shoulders of these parents.  \n\nWe receive more and more requests for help every day. Moms and their children are in distress, since the poor aid allocated by the state is not enough for anything. These children seem to check the world for kindness. On our sacrificial hearts. Stories of some children can be found on our web-site. \n\nWe invite everyone who would like to support families financially, to become a part of this project. After all, the really happy person is the one who makes others happy, and in this project you can make happy not only one child but the whole family.", comment: "happiness in every family desc"))]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupController()
        Setup.shared.backgroundSetupOnCollectionViewController(view: self.view, collectionView: self.collectionView!)
    }
    
    func setupController() {
        navigationItem.title = NSLocalizedString("Projects", comment: "projects")
    }

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ProjectDetailsViewController" {
            if let controller = segue.destination as? ProjectDetailsViewController,
                let projectModel = sender as? Project {
                
                controller.projects = projectModel
            }
        }
    }

    // MARK: UICollectionViewDataSource
    
    fileprivate let itemsPerRow: CGFloat = 1
    fileprivate let sectionInsets = UIEdgeInsets(top: 10.0, left: 10.0, bottom: 10.0, right: 10.0)

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return projects.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! ProjectCollectionViewCell
        
        let project = projects[indexPath.row]
        cell.projectInCellImage.image = project.projectImage
        cell.projectInCellLabel.text = project.projectName
        cell.projectInCellIcon.image = project.projectIcon
        
        cell.layer.cornerRadius = 10
        cell.clipsToBounds = true
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        
        let translationTransform = CATransform3DTranslate(CATransform3DIdentity, -500, 400, 0)
        cell.layer.transform = translationTransform
        UIView.animate(withDuration: 1, delay: 0.2 * Double(indexPath.row), options: .curveEaseOut, animations: {
            cell.layer.transform = CATransform3DIdentity
        })
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let project = projects[indexPath.row]
        
        performSegue(withIdentifier: "ProjectDetailsViewController", sender: project)
    }
}

extension ProjectsCollectionViewController: UICollectionViewDelegateFlowLayout {
    
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

