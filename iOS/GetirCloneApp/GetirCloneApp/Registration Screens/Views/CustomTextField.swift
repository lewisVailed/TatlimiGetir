//
//  CustomTextField.swift
//  GetirCloneApp
//
//  Created by Ayberk Bilgiç on 29.04.2024.
//

import UIKit

class CustomTextField: UITextField {

    enum CustomTextFieldType {
        case email
        case password
        case username
    }

    private let authFieldType: CustomTextFieldType
    
    init(fieldType: CustomTextFieldType) {
        self.authFieldType = fieldType
        super.init(frame: .zero)
        
        self.returnKeyType = .done
        self.autocorrectionType = .no
        self.autocapitalizationType = .none
        
        self.leftViewMode = .always
        self.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 12, height: self.frame.size.height))
        
        self.backgroundColor = .systemBackground
        self.borderStyle = .roundedRect
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.lightGray.cgColor
        self.layer.cornerRadius = 10


        
        switch fieldType {
        case .email:
            self.placeholder = "E-posta"
            
            self.keyboardType = .emailAddress
            self.textContentType = .emailAddress
        case .password:
            self.placeholder = "Şifre (En az 4 karakter)"
            self.isSecureTextEntry = true
            self.textContentType = .oneTimeCode
        case .username:
            self.placeholder = "Ad Soyad"
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
