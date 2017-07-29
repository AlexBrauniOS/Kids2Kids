//
//  ProjectsTableViewController.swift
//  Kids2Kids
//
//  Created by Oleksii Liubarets on 21.07.17.
//  Copyright © 2017 Oleksii Liubarets. All rights reserved.
//

import UIKit

class ProjectsTableViewController: UITableViewController {
    
    let projects: [Project] = [Project(projectName: "Дорога в жизнь", projectImage: #imageLiteral(resourceName: "DorogaVZhizn"), projectDescription: "Благотворительный проект в поддержку выпускников детдомов и школ-интернатов Украины. Окончание школы - это самая ответственная пора для ребят. На протяжении года, наш проект стремиться подготовить их к этому периоду психологически, духовно и практически. Проводятся семинары по профориентации, в которых принимают участие специалисты разных видов прикладных профессий. Завершающим этапом является благотворительное мероприятие “Дорога в Жизнь”. Партнеры проекта собирают вещи со всем необходимым, что может пригодиться выпускникам в самостоятельной жизни. Каждому желающему участвовать в проекте, команда фонда передает письмо от конкретного выпускника, где тот описывает свои желания и цели в жизни. Благодаря такому личному участию образуется связь с ребенком, которому мы помогаем."),
                               Project(projectName: "Рождественский ангел", projectImage: #imageLiteral(resourceName: "RozhdestvenskiyAngel"), projectDescription: "Каждый год к Рождеству мы получаем сотни писем от детей из детдомов и интернатов, в которых они открывают свое заветное желание. Эти желания исполняют «рождественские ангелы» – партнеры проекта вместе со своими детьми. Они не только дарят подарки, о которых дети мечтали весь год, но так же пишут ответные письма. Это дает возможность ребёнку в детдоме поверить в чудо – что есть Бог и Его Ангелы, которые слышат их просьбы и всё, что нужно – это верить в чудеса, которые способен творить наш Господь."),
                               Project(projectName: "Открытые сердца", projectImage: #imageLiteral(resourceName: "OtkrytyeSerdca"), projectDescription: "Ежегодное благотворительное мероприятие, направленное на сбор средств на конкретные нужды детдомов и интернатов. Дети, которые приходят с родителями на этот праздник делают своими руками сердца и посылают их деткам в детдома. Сотни сердец из керамики, ткани, гипса, бумаги, разрисованные красками и мелками отправляются с любовью в разные уголки Украины. В свою очередь дети из детдомов и интернатов отправляют на праздник свои подарки, приготовленные заранее. Проект «Открытые сердца» объединяет сотни детей по всей стране, показывая тем самым, как важно открывать свои сердца навстречу друг другу."),
                               Project(projectName: "Щастя в кожну родину", projectImage: #imageLiteral(resourceName: "SchastieVKozhnuRodynu"), projectDescription: "Это адресная помощь семьям с детьми инвалидами, прикованными к постели. Каждый месяц мы развозим по семьям, которые включены в наш проект, необходимые лекарства, средства личной гигиены и другую необходимую помощь. В данном случае мы видим насколько это важно для мам, что есть люди, которые о них помнят и помогают. Учитывая тот факт, что мамы круглосуточно находятся при больном ребенке, каждый человек, который переступает порог является для них большой поддержкой. Этот проект еще одна возможность проявить христианскую любовь к тем семьям, которые вынуждены сражаться за жизнь своих детей каждый день.")]
    
    var array: [Project] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        array.removeAll()
        self.tabBarController!.tabBar.barTintColor = UIColor.fundYellowColor
    }

    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
            var i = 0.0
                for project in projects {
                    delay(i, closure: {
                        self.array.append(project)
                    })
                    i += 0.2
            }
    }
    
    func delay(_ delay:Double, closure:@escaping ()->()) {
        let when = DispatchTime.now() + delay
        DispatchQueue.main.asyncAfter(deadline: when, execute: closure)
    }
    
    func setup() {
        self.navigationItem.title = "Проекты"
        self.navigationController!.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.fundBlueColor, NSFontAttributeName: UIFont(name: "Co Text Corp", size: 22)!]
        self.view.backgroundColor = UIColor.fundYellowColor.withAlphaComponent(1.0)
        self.navigationController!.navigationBar.barTintColor = UIColor.fundYellowColor
        self.navigationController!.navigationItem.backBarButtonItem?.tintColor = UIColor.fundBlueColor
        self.tabBarController!.tabBar.tintColor = UIColor.fundBlueColor
        self.tabBarController!.tabBar.unselectedItemTintColor = UIColor.darkGray
    }
    
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return array.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! ProjectTableViewCell

        let project = array[indexPath.row]
        cell.projectInCellImage.image = project.projectImage
        cell.projectInCellLabel.text = project.projectName
        
        if (indexPath.row == (self.tableView.numberOfRows(inSection: 0) - 1)) {
            cell.contentView.alpha = 0
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        if (indexPath.row == (self.tableView.numberOfRows(inSection: 0) - 1)) {
            UIView.animate(withDuration: 0.2, animations: {
                cell.contentView.alpha = 1.0
            })
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let project = array[indexPath.row]
        
        performSegue(withIdentifier: "ProjectDetailsViewController", sender: project)
    }
    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "ProjectDetailsViewController" {
            if let controller = segue.destination as? ProjectDetailsViewController,
                let projectModel = sender as? Project {
            
                controller.projects = projectModel
            }
        }
    }
}
