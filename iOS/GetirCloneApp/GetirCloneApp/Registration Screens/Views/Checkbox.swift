//
//  Checkbox.swift
//  GetirCloneApp
//
//  Created by Ayberk Bilgiç on 29.04.2024.
//

import UIKit

class Checkbox: UIButton{

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
    
    
    init(isChecked: Bool) {
        super.init(frame: .zero)
        self.isChecked = isChecked
        self.setupUI()
        updateCheckbox()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        self.addSubview(checkboxButton)
        checkboxButton.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = .systemBackground
        
        NSLayoutConstraint.activate([
            checkboxButton.centerYAnchor.constraint(equalTo: centerYAnchor),
            checkboxButton.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
        
    }
    
    @objc func checkboxTapped() {
        isChecked.toggle()
    }
    
    func updateCheckbox() {
        let imageName = isChecked ? "checkmark.square.fill" : "square"
        checkboxButton.setImage(UIImage(systemName: imageName), for: .normal)
    }
}
