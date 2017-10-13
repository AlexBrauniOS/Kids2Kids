//
//  Setup.swift
//  Kids2Kids
//
//  Created by Oleksii Liubarets on 13.10.17.
//  Copyright © 2017 Oleksii Liubarets. All rights reserved.
//

import Foundation
import UIKit

class Setup {
    
    static let shared = Setup()
    
    private init() {
    }
    
    func backgroundSetupOnCollectionViewController(view: UIView, collectionView: UICollectionView) {
        let background = UIImage(named: "Background")
        let imageView: UIImageView!
        imageView = UIImageView(frame: view.bounds)
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = background!
        collectionView.backgroundView = imageView
    }
    
    func backgroundSetupOnViewController(view: UIView) {
        
        let background = UIImageView(frame: UIScreen.main.bounds)
        background.image = UIImage(named: "Background")
        background.contentMode = .scaleAspectFill
        background.clipsToBounds = true
        view.insertSubview(background, at: 0)
    }
    
    func navigationControllerSizeInIosElevenSetup(navigationItem: UINavigationItem) {
        
        if #available(iOS 11.0, *) {
            navigationItem.largeTitleDisplayMode = .never
        } else {
            // Fallback on earlier versions
        }
    }
    
}
