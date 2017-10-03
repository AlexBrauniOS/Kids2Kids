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
    
    /*
     
     
     
     */

    let projects: [Project] = [Project(projectName: "Дорога в жизнь", projectImage: #imageLiteral(resourceName: "DorogaVZhizn"), projectIcon: #imageLiteral(resourceName: "sun"), projectDescription: "«Дорога в Жизнь» — благотворительный проект в поддержку выпускников детдомов и школ-интернатов Украины. \n\nОкончание школы — это самая ответственная пора для ребят. На протяжении года наш проект стремится подготовить их к этому периоду психологически, духовно и практически. Проводятся семинары по профориентации, в которых принимают участие специалисты разных видов прикладных профессий. \n\nЗавершающим этапом является благотворительное мероприятие «Дорога в Жизнь». Партнеры проекта собирают вещи со всем необходимым, что может пригодиться выпускникам в самостоятельной жизни. Каждому желающему участвовать в проекте, команда фонда передает письмо от конкретного выпускника, где тот описывает свои желания и цели в жизни. Благодаря такому личному участию образуется связь с ребенком, которому мы помогаем и искренне желаем успеха в его взрослой жизни. Многие наши участники не только готовят сумки, но и пишут ответные письма с важными напутственными советами, а также предоставляют помощь в трудоустройстве и проживании выпускников на новом месте. \n\nВ 2017 году проект охватил 86 детей из 9 детдомов и школ-интернатов Украины. Благодаря нашим гостям они получили не только самые необходимые вещи для самостоятельной жизни, но и красивые выпускные платья, рубашки, галстуки и обувь."),
                               Project(projectName: "Рождественский ангел", projectImage: #imageLiteral(resourceName: "RozhdestvenskiyAngel"), projectIcon: #imageLiteral(resourceName: "angel"), projectDescription: "«Рождественский ангел» — ежегодное благотворительное мероприятие, которое объединяет сотни семей в преддверии Нового Года и дает им возможность начать следующий год с того, чтобы подарить радость детям сиротам и нуждающимся семьям. \n\nКаждый год к Рождеству мы получаем сотни писем от детей из детдомов и интернатов, в которых они открывают свое заветное желание. \n\nЭти желания исполняют «Рождественские Ангелы» — партнеры проекта вместе со своими детьми. Они не только дарят подарки, о которых дети мечтали весь год, но и так же пишут ответные письма. Это дает возможность ребёнку в детдоме поверить в чудо — что есть Бог и Его Ангелы, которые слышат их просьбы и всегда выполняют, только нужно верить. \n\nЭто также дает возможность ребенку из полноценной семьи проявить сострадание и протянуть руку помощи другому ребенку, который уже испытал, что значит жить в этом мире без родителей."),
                               Project(projectName: "Открытые сердца", projectImage: #imageLiteral(resourceName: "OtkrytyeSerdca"), projectIcon: #imageLiteral(resourceName: "talkHeart"), projectDescription: "«Открытые сердца» — это ежегодное благотворительное мероприятие фонда Дети Детям, направленное на сбор средств на конкретные нужды детей из детдомов, школ-интернатов и реабилитационных центров. В рамках мероприятия мы так же собираем средства на лечение тяжелобольных детей, которые нуждаются в экстренной помощи. \n\nДети, которые приходят с родителями на этот праздник делают своими руками сердца и посылают их деткам в детдома. Сотни сердец из керамики, ткани, гипса, бумаги, разрисованные красками и мелками, отправляются с любовью в разные уголки Украины. В свою очередь дети из детдомов и интернатов отправляют на праздник свои подарки, приготовленные заранее. \n\nПроект «Открытые сердца» объединяет сотни детей по всей Украине, показывая тем самым, как важно открывать свои сердца навстречу друг другу."),
                               Project(projectName: "Щастя в кожну родину", projectImage: #imageLiteral(resourceName: "SchastieVKozhnuRodynu"), projectIcon: #imageLiteral(resourceName: "star"), projectDescription: "«Щастя в кожну родину» — проект нашего фонда, который стартовал в 2015 году с нескольких семей и расширяется с каждым днем. \n\nЭто адресная помощь семьям с детьми, прикованными к постели страшными недугами. \n\nКаждый месяц мы приезжаем в эти семьи и привозим лекарства, памперсы и вещи, которые помогают нам приобрести партнеры этого проекта. Такая помощь для семей является очень большой поддержкой и главное — осознанием того, что этот мир не отвернулся от них. Что есть люди, которые своим вкладом стремятся разделить тяжесть, которая выпала на плечи родителей. Учитывая тот факт, что мамы круглосуточно находятся при больном ребенке, каждый человек, который переступает порог является для них большой поддержкой. Этот проект еще одна возможность проявить христианскую любовь к тем семьям, которые вынуждены сражаться за жизнь своих детей каждый день. Каждый наш приезд всегда ждут с нетерпением. \n\nС каждым новым днем мы получаем все больше просьб о помощи. Мамы и их дети находятся в бедственном положении, так как мизерной помощи, выделяемой государством не хватает ни на что. Эти дети как будто проверяют мир на доброту. На наши жертвенные сердца. Истории некоторых семей вы можете найти на нашем сайте. \n\nПриглашаем всех, кто хотел бы поддерживать семьи материально, стать частью этого проекта. Ведь по настоящему счастлив тот человек, который делает счастливыми других, а в этом проекте вы сможете сделать счастливой целую семью.")]
    
    var array: [Project] = [] {
        didSet {
            collectionView?.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        getProjectsArray()
    }
    
    func delay(_ delay:Double, closure:@escaping ()->()) {
        let when = DispatchTime.now() + delay
        DispatchQueue.main.asyncAfter(deadline: when, execute: closure)
    }
    
    func getProjectsArray() {
        var i = 0.0
        for project in projects {
            delay(i, closure: {
                self.array.append(project)
            })
            i += 0.2
        }
    }
    
    func setup() {
        
        self.navigationItem.title = "Проекты"
        self.navigationController!.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.fundBlueColor, NSFontAttributeName: UIFont(name: "Co Text Corp", size: 19)!]
        if #available(iOS 11.0, *) {
            self.navigationController?.navigationBar.prefersLargeTitles = true
            self.navigationController?.navigationBar.largeTitleTextAttributes = [NSForegroundColorAttributeName: UIColor.fundBlueColor, NSFontAttributeName: UIFont(name: "Co Text Corp", size: 33)!]
            
        } else {
            // Fallback on earlier versions
        }
        
        let background = UIImage(named: "Background")
        let imageView: UIImageView!
        imageView = UIImageView(frame: view.bounds)
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = background!
        self.collectionView?.backgroundView = imageView
        
        self.navigationController!.navigationBar.tintColor = UIColor.fundBlueColor
        self.tabBarController!.tabBar.tintColor = UIColor.fundBlueColor
        self.tabBarController!.tabBar.unselectedItemTintColor = UIColor.darkGray
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
        
        return array.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! ProjectCollectionViewCell
        
        let project = array[indexPath.row]
        cell.projectInCellImage.image = project.projectImage
        cell.projectInCellLabel.text = project.projectName
        cell.projectInCellIcon.image = project.projectIcon
        
        cell.layer.cornerRadius = 10
        cell.clipsToBounds = true
        
        if (indexPath.row == ((self.collectionView?.numberOfItems(inSection: 0))! - 1)) {
            cell.contentView.alpha = 0
        }
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        
        if (indexPath.row == ((self.collectionView?.numberOfItems(inSection: 0))! - 1)) {
            UIView.animate(withDuration: 0.2, animations: {
                cell.contentView.alpha = 1.0
            })
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let project = array[indexPath.row]
        
        performSegue(withIdentifier: "ProjectDetailsViewController", sender: project)
    }

    // MARK: UICollectionViewDelegate

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

