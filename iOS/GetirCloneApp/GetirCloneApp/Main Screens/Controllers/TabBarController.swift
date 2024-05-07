//
//  TabBarController.swift
//  GetirCloneApp
//
//  Created by Ayberk Bilgiç on 4.05.2024.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupTabs()
        
        self.tabBar.tintColor = getirColor
        self.tabBar.unselectedItemTintColor = .systemGray
        
        
    }
    
    let getirColor = UIColor(red: 92/255, green: 60/255, blue: 187/255, alpha: 1)
    
    // MARK: - Tab Setup
    private func setupTabs() {
        let vc1 = HomeController()
        let vc2 = SearchController()
        let vc3 = ProfileController()
        let vc4 = ProductCartController()
        
        // Set tab Images
        vc1.tabBarItem.image = UIImage(systemName: "house.fill")
        vc2.tabBarItem.image = UIImage(systemName: "magnifyingglass")
        vc3.tabBarItem.image = UIImage(systemName: "person.fill")
        vc4.tabBarItem.image = UIImage(systemName: "cart.fill")
        
        let nav1 = UINavigationController(rootViewController: vc1)
        let nav2 = UINavigationController(rootViewController: vc2)
        let nav3 = UINavigationController(rootViewController: vc3)
        let nav4 = UINavigationController(rootViewController: vc4)
        
        
        self.setViewControllers([nav1, nav2, nav3, nav4], animated: true)
        self.tabBar.backgroundColor = .systemBackground
        
    }
    


    
    
}
