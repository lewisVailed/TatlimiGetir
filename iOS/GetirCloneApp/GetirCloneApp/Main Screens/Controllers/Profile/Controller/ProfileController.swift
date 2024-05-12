//
//  ProfileController.swift
//  GetirCloneApp
//
//  Created by Ayberk Bilgiç on 4.05.2024.
//

import UIKit

class ProfileController: UIViewController {

    
    // MARK: - UI Components
    private let profileName = ProfileView(label: "Ayberk Bilgiç", image: "person.fill")
    private let emailName = ProfileView(label: "lewidvailed@gmail.com", image: "mail.stack.fill")
    private let phoneName = ProfileView(label: "+90 543 145 92 21", image: "phone.fill")
    
    static let getirColor = UIColor(red: 92/255, green: 60/255, blue: 187/255, alpha: 1)
    
    private let nameButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "icon_arrow")?.withTintColor(getirColor, renderingMode: .alwaysOriginal), for: .normal)
        
        return button
    }()
    
    private let emailButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "icon_arrow")?.withTintColor(getirColor, renderingMode: .alwaysOriginal), for: .normal)
        
        return button
    }()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.makeOpaqueNavBar()
        self.setupUI()
        
    }
    
    
    

    // MARK: - UI Setup
    private func setupUI() {
        self.view.backgroundColor = .secondarySystemBackground
        self.navigationItem.title = "Profile"
        
        let line = UIView(frame: CGRect(x: 20, y: 150, width: 400, height: 10))
        let linetwo = UIView(frame: CGRect(x: 20, y: 260, width: 340, height: 1))
        linetwo.backgroundColor = .systemGray5
        
        let linethree = UIView(frame: CGRect(x: 20, y: 175, width: 340, height: 1))
        linethree.backgroundColor = .systemGray5
        
        let targetView = UIView(frame: CGRect(x: 0, y: 100, width: 400, height: 250))
        targetView.backgroundColor = .systemBackground
        
        self.view.insertSubview(line, at: 0)
        self.view.insertSubview(linetwo, at: 3)
        self.view.insertSubview(linethree, at: 2)
        self.view.insertSubview(targetView, at: 1)
        self.view.insertSubview(profileName, at: 4)
        self.view.insertSubview(emailName, at: 5)
        self.view.insertSubview(phoneName, at: 6)
        self.view.insertSubview(nameButton, at: 7)
        self.view.insertSubview(emailButton, at: 8)
        
        
        profileName.translatesAutoresizingMaskIntoConstraints = false
        emailName.translatesAutoresizingMaskIntoConstraints = false
        phoneName.translatesAutoresizingMaskIntoConstraints = false
        
        nameButton.translatesAutoresizingMaskIntoConstraints = false
        emailButton.translatesAutoresizingMaskIntoConstraints = false
        
        
        NSLayoutConstraint.activate([
            self.profileName.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            self.profileName.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 50),
            self.profileName.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.profileName.heightAnchor.constraint(equalToConstant: 80),
            
            self.nameButton.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 125),
            self.nameButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20),
            self.nameButton.widthAnchor.constraint(equalToConstant: 20),
            self.nameButton.heightAnchor.constraint(equalToConstant: 20),
            
            self.emailName.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            self.emailName.topAnchor.constraint(equalTo: self.profileName.bottomAnchor, constant: 50),
            self.emailName.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.emailName.heightAnchor.constraint(equalToConstant: 80),
            
            self.emailButton.topAnchor.constraint(equalTo: self.profileName.bottomAnchor, constant: 80),
            self.emailButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20),
            self.emailButton.widthAnchor.constraint(equalToConstant: 20),
            self.emailButton.heightAnchor.constraint(equalToConstant: 20),
            
            self.phoneName.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            self.phoneName.topAnchor.constraint(equalTo: self.emailName.bottomAnchor),
            self.phoneName.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.emailName.heightAnchor.constraint(equalToConstant: 80),
        
        ])
        
    }

    

}
