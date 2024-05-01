//
//  CustomButton.swift
//  GetirCloneApp
//
//  Created by Ayberk Bilgiç on 29.04.2024.
//

import UIKit

class CustomButton: UIButton {

    init(title: String) {
        super.init(frame: .zero)
        self.setTitle(title, for: .normal)
        self.layer.cornerRadius = 8
        self.layer.masksToBounds = true
        
        self.backgroundColor = UIColor(red: 92/255, green: 60/255, blue: 187/255, alpha: 1)
        let titleColor: UIColor = .white
        self.setTitleColor(titleColor, for: .normal)
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
