//
//  CheckBoxTwo.swift
//  GetirCloneApp
//
//  Created by Ayberk Bilgiç on 29.04.2024.
//

import UIKit

class CheckboxTwo: UIViewController {
    
    var isChecked: Bool = false {
        didSet {
            updateCheckbox()
        }
    }
    
    let checkboxButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "square"), for: .normal)
        button.tintColor = .black
        button.addTarget(self, action: #selector(checkboxTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemBackground
        view.addSubview(checkboxButton)
        
        NSLayoutConstraint.activate([
            checkboxButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            checkboxButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        updateCheckbox()
    }
    
    @objc func checkboxTapped() {
        isChecked.toggle()
    }
    
    func updateCheckbox() {
        let imageName = isChecked ? "checkmark.square.fill" : "square"
        checkboxButton.setImage(UIImage(systemName: imageName), for: .normal)
    }
}
