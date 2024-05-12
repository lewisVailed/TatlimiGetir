//
//  ProfileController.swift
//  GetirCloneApp
//
//  Created by Ayberk Bilgiç on 4.05.2024.
//

import UIKit

class ProfileController: UIViewController {

    private let profileName = ProfileView(label: "Ayberk Bilgiç", image: "person.fill")
    private let emailName = ProfileView(label: "lewidvailed@gmail.com", image: "mail.stack.fill")
    private let phoneName = ProfileView(label: "+90 543 145 92 21", image: "phone.fill")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.makeOpaqueNavBar()
        self.setupUI()
    }
    

    // MARK: - UI Setup
    private func setupUI() {
        self.view.backgroundColor = .secondarySystemBackground
        self.navigationItem.title = "Profile"
        
        self.view.addSubview(profileName)
        self.view.addSubview(emailName)
        self.view.addSubview(phoneName)
        profileName.translatesAutoresizingMaskIntoConstraints = false
        emailName.translatesAutoresizingMaskIntoConstraints = false
        phoneName.translatesAutoresizingMaskIntoConstraints = false
        
        
        NSLayoutConstraint.activate([
            self.profileName.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            self.profileName.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 50),
            self.profileName.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.profileName.heightAnchor.constraint(equalToConstant: 80),
            
            self.emailName.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            self.emailName.topAnchor.constraint(equalTo: self.profileName.bottomAnchor, constant: 50),
            self.emailName.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.emailName.heightAnchor.constraint(equalToConstant: 80),
            
            self.phoneName.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            self.phoneName.topAnchor.constraint(equalTo: self.emailName.bottomAnchor),
            self.phoneName.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.emailName.heightAnchor.constraint(equalToConstant: 80),
        
        ])
        
    }

    

}
