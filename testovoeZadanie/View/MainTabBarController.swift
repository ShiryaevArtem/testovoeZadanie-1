//
//  MainTabBarController.swift
//  testovoeZadanie
//
//  Created by Artem on 16.12.2022.
//

import Foundation
import UIKit
class MainTabBarController: UITabBarController {
    
    var viewModels = ViewModels()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabBar.backgroundColor = .gray
        let photosVC = PhotosCollectionViewController(collectionViewLayout: UICollectionViewFlowLayout())
        
        viewControllers = [
            viewModels.generateNavigationController(rootViewController: photosVC, title: "photos", image: #imageLiteral(resourceName: "image")),
            viewModels.generateNavigationController(rootViewController: ViewController(), title: "favorites", image: #imageLiteral(resourceName: "image"))
        ]
       
    }
    func seeImage(rootViewController: UIViewController) -> UIViewController {
        let navigationVC = UINavigationController(rootViewController: rootViewController)
        return navigationVC
    }
    
}
