//
//  AuthHeaderView.swift
//  GetirCloneApp
//
//  Created by Ayberk Bilgiç on 15.04.2024.
//

import UIKit

class AuthHeaderView: UIView {

    // MARK: - UI Componenta
    private let title: UILabel = {
        let label = UILabel()
        label.textColor = .systemPurple
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.text = ""
        return label
    }()

    init(title: String) {
        super.init(frame: .zero)
        self.setupUI()
        self.title.text = title
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        self.addSubview(title)
        title.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            self.title.topAnchor.constraint(equalTo: self.layoutMarginsGuide.topAnchor, constant: 30),
            self.title.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.title.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.title.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            
        ])
        
    }
    
}
