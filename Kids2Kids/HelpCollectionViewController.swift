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
    
    var helpArray: [Help] = [Help(name: "Финансовая помощь", image: #imageLiteral(resourceName: "talkHeart"), description: "Благотворительный фонд «Дети Детям» будет благодарен любой помощи. \nФинансовую помощь фонду Вы можете оказать по следующим реквизитам: \nПриватБанк \nр/с 26000056127077 \nМФО 380775 \nЕДРПО 41350891 \n\nНазначение платежа: \n«Благотворительный взнос»", color: .fundGreenColor),
                             Help(name: "Конкретному ребёнку", image: #imageLiteral(resourceName: "heart"), description: "Помогать конкретному ребёнку можно, подключив ежемесячное пожертвование в рамках проекта «Щастя в кожну родину». \n\nКоманда благотворительного фонда «Дети Детям» регулярно получает просьбы о помощи от семей с тяжелобольными детьми. \n\nКак работает проект: \n1.Мы встречаемся с родителями детей и принимаем решение о включении семьи в программу фонда; \n2.Составляем список и бюджет ежемесячных нужд отдельно для каждой семьи c тяжелобольным ребенком; \n3.Регулярно финансируем семьи благодаря пожертвованиям друзей фонда и наших партнеров. \n\nПрисоединяйтесь к проекту! \nВаши ежемесячные пожертвования могут помочь тяжелобольным детям!", color: .fundRedColor),
                             Help(name: "Передать вещи", image: #imageLiteral(resourceName: "star"), description: "У Вас остались почти новые обувь и вещи? Чистые и исправные вещи еще могут послужить! \n\nДети из детских домов и школ-интернатов примут их с радостью. Видя чистые, выглаженные и аккуратно сложенные в пакет вещи, дети почувствуют вашу заботу и будут благодарны за подарок! \n\n Самые актуальные нужды: \n - одежда всех сезонов и разных размеров; \n - обувь всех сезонов, назначений и размеров (тапочки, спортивные кеды и кроссовки, др.); \n - спортивная одежда; \n - шапки, варежки, шарфы; \n - постельное белье, одеяла, пледы, подушки; \n - средства личной гигиены; \n - памперсы, одноразовые пеленки. \n\nЕсли у вас есть эти сокровища, то несите их к нам!", color: .fundBlueColor),
                             Help(name: "Стать волонтёром", image: #imageLiteral(resourceName: "angel"), description: "Волонтеры - это люди, без которых сложно представить полноценную работу фонда! \n\nПомогать в проведении мероприятий, участвовать в программе профориентации будущих выпускников. \n\nЧем Вы можете помочь фонду «Дети Детям»: \n - закупать и развозить нужды в детдома, школы-интернаты, семьи; \n - помогать проводить мероприятия; \n - оказывать психологическую помощь детям и родителям тяжело-больных детей; \n - проводить обучение в рамках программы профориентации (проект «Дорога в жизнь»). \n\nЕсли у Вас есть время, а главное желание помочь: \nзвоните нам \n+38 050 594 89 35 \n+38 050 471 30 30 \nили пишите \nweb@kids2kids-fund.com.", color: .fundYellowColor),
                             Help(name: "Организациям", image: #imageLiteral(resourceName: "cloud"), description: "Приглашаем компании поддержать наши проекты помощи детдомам, школам-интернатам, реабилитационным центрам: \n - отправка детей в детские лагеря; \n - покупка мебели; \n - оплата ремонтных работ; \n - покупка бытовой техники", color: .fundGreenColor)]
    
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
            i += 0.3
        }
    }
    
    func setup() {
        
        navigationItem.title = "Помощь"
        
        let background = UIImage(named: "Background")
        let imageView: UIImageView!
        imageView = UIImageView(frame: view.bounds)
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = background!
        self.collectionView?.backgroundView = imageView
    }

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
        
        return cell
    }

    // MARK: UICollectionViewDelegate

    override func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if (indexPath.row == ((self.collectionView?.numberOfItems(inSection: 0))! - 1)) {
            UIView.animate(withDuration: 0.3, animations: {
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
