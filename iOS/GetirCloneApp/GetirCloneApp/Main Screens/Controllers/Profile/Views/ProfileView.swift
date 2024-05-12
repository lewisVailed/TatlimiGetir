//
//  ProfileView.swift
//  GetirCloneApp
//
//  Created by Ayberk Bilgiç on 12.05.2024.
//

import UIKit

class ProfileView: UIView {

   
    
    let getirColor = UIColor(red: 92/255, green: 60/255, blue: 187/255, alpha: 1)
    
    // MARK: - UI Components
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = .white
        imageView.image = UIImage(systemName: "")
        
        return imageView
    }()
    
    private let label: UILabel = {
        let label = UILabel()
        label.textColor = .darkGray
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 16, weight: .regular)
        label.text = ""
 
        return label
    }()
    
    // MARK: - Init
    init(label: String, image: String) {
        super.init(frame: .zero)
        
        self.label.text = label
        self.imageView.image = UIImage(systemName: image)?.withTintColor(getirColor, renderingMode: .alwaysOriginal)
        self.setupUI()
        
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UI Setup
    private func setupUI() {
        
        self.addSubview(imageView)
        self.addSubview(label)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        label.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            self.label.topAnchor.constraint(equalTo: self.layoutMarginsGuide.topAnchor, constant: 25),
            self.label.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 100),
            self.label.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            
            self.imageView.topAnchor.constraint(equalTo: self.layoutMarginsGuide.topAnchor, constant: 20),
            self.imageView.trailingAnchor.constraint(equalTo: self.label.leadingAnchor, constant: -40),
            self.imageView.heightAnchor.constraint(equalToConstant: 30),
            self.imageView.widthAnchor.constraint(equalToConstant: 30),

        ])
        
    }

}
