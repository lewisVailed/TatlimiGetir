//
//  Extension.swift
//  GetirCloneApp
//
//  Created by Ayberk Bilgiç on 2.05.2024.
//

import Foundation

import UIKit.UIViewController

extension UIViewController {

    func makeOpaqueNavBar() {
        DispatchQueue.main.async { [weak self] in
            guard let self else { return }
            let appearance = UINavigationBarAppearance()
            appearance.configureWithOpaqueBackground()
            appearance.backgroundColor = UIColor(red: 92/255, green: 60/255, blue: 187/255, alpha: 1)
            appearance.shadowColor = .clear
            appearance.titleTextAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
            navigationController?.navigationBar.standardAppearance = appearance
            navigationController?.navigationBar.scrollEdgeAppearance = navigationController?.navigationBar.standardAppearance
            
            
        }
    }
    
    func makeOpaqueNavBarForTabBar() {
        DispatchQueue.main.async { [weak self] in
            guard let self else { return }
            let appearance = UINavigationBarAppearance()
            appearance.configureWithOpaqueBackground()
            appearance.backgroundColor = UIColor(red: 92/255, green: 60/255, blue: 187/255, alpha: 1)
            appearance.shadowColor = .clear
            appearance.titleTextAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
            navigationController?.navigationBar.standardAppearance = appearance
            navigationController?.navigationBar.scrollEdgeAppearance = navigationController?.navigationBar.standardAppearance
            
            
        }
    }



    func makeTransclucentNavBar() {
        DispatchQueue.main.async { [weak self] in
            guard let self else { return }
            let appearance = UINavigationBarAppearance()
            appearance.configureWithTransparentBackground()
            appearance.backgroundColor = .clear
            appearance.shadowColor = .clear
            navigationController?.navigationBar.standardAppearance = appearance
            navigationController?.navigationBar.scrollEdgeAppearance = navigationController?.navigationBar.standardAppearance
            navigationController?.isNavigationBarHidden = false
        }
    }
    
    
}


extension String {
    var toInt: Int? {
        return Int(self)
    }
}

extension Int {
    var toString: String? {
        return String(self)
    }
}



