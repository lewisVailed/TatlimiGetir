//
//  LoginController.swift
//  GetirCloneApp
//
//  Created by Ayberk Bilgiç on 3.05.2024.
//

import UIKit

class LoginController: UIViewController {

    // MARK: - UI Components
    private let headerViewLogin = AuthHeaderView(title: "Tatlımı Getir'e Giriş Yap!")
    private let usernameFieldLogin = CustomTextField(fieldType: .username)
    private let passwordFieldLogin = CustomTextField(fieldType: .password)
    private let loginButton = CustomButton(title: "Giriş Yap")
    
    private let termsTextViewLogin: UITextView = {
        let textView = UITextView()
        
        let attributedString = NSMutableAttributedString(string: "Kişisel verilerine dair Aydınlatma Metni için tıklayınız.")
        attributedString.addAttribute(.link, value: "terms://termsOfConditions", range: (attributedString.string as NSString).range(of: "tıklayınız."))
        
        textView.linkTextAttributes = [.foregroundColor: UIColor(red: 92/255, green: 60/255, blue: 187/255, alpha: 1)]
        textView.attributedText = attributedString
        textView.textColor = .label
        textView.backgroundColor = .clear
        textView.isEditable = false
        textView.isSelectable = true
        textView.isScrollEnabled = false
        textView.delaysContentTouches = false
        return textView
    }()
    
    private let reminderButton: UIButton = {
        let rmdButton = UIButton()
        let color = UIColor(red: 92/255, green: 60/255, blue: 187/255, alpha: 1)
        rmdButton.backgroundColor = .white
        rmdButton.titleLabel?.font = .systemFont(ofSize: 16, weight: .semibold)
        rmdButton.setTitleColor(color ,for: .normal)
        rmdButton.setTitle("Henüz üye olmadınız mı? Üye olun.", for: .normal)
        return rmdButton
    }()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
        
        self.makeOpaqueNavBar()
        
        termsTextViewLogin.delegate = self
        
    }
    
    // MARK: - UI Setup

    private func setupUI() {
        self.view.addSubview(headerViewLogin)
        self.view.addSubview(usernameFieldLogin)
        self.view.addSubview(passwordFieldLogin)
        self.view.addSubview(loginButton)
        self.view.addSubview(termsTextViewLogin)
        self.view.addSubview(reminderButton)
        
        headerViewLogin.translatesAutoresizingMaskIntoConstraints = false
        usernameFieldLogin.translatesAutoresizingMaskIntoConstraints = false
        passwordFieldLogin.translatesAutoresizingMaskIntoConstraints = false
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        termsTextViewLogin.translatesAutoresizingMaskIntoConstraints = false
        reminderButton.translatesAutoresizingMaskIntoConstraints = false
        
        reminderButton.addTarget(self, action: #selector(didTapReminderButton), for: .touchUpInside)
        
        self.view.backgroundColor = .systemBackground
        self.navigationItem.title = "Giriş Yap"
        
        NSLayoutConstraint.activate([
            self.headerViewLogin.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            self.headerViewLogin.topAnchor.constraint(equalTo: self.view.topAnchor),
            self.headerViewLogin.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.headerViewLogin.heightAnchor.constraint(equalToConstant: 160),
            
            self.usernameFieldLogin.topAnchor.constraint(equalTo: headerViewLogin.bottomAnchor, constant: 20),
            self.usernameFieldLogin.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            self.usernameFieldLogin.heightAnchor.constraint(equalToConstant: 55),
            self.usernameFieldLogin.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
            
            self.passwordFieldLogin.topAnchor.constraint(equalTo: usernameFieldLogin.bottomAnchor, constant: 20),
            self.passwordFieldLogin.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            self.passwordFieldLogin.heightAnchor.constraint(equalToConstant: 55),
            self.passwordFieldLogin.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
            
            self.termsTextViewLogin.topAnchor.constraint(equalTo: passwordFieldLogin.bottomAnchor, constant: 20),
            self.termsTextViewLogin.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            self.termsTextViewLogin.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 25),
            self.termsTextViewLogin.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
        
            self.loginButton.bottomAnchor.constraint(equalTo: self.view.layoutMarginsGuide.bottomAnchor),
            self.loginButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            self.loginButton.heightAnchor.constraint(equalToConstant: 50),
            self.loginButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
            
            self.reminderButton.bottomAnchor.constraint(equalTo: loginButton.topAnchor, constant: -20),
            self.reminderButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            self.reminderButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 25),
            self.reminderButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
        
        ])
    }
    
    @objc func didTapReminderButton() {
        let vc = RegisterController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
}

extension LoginController: UITextViewDelegate {
     
    func textView(_ textView: UITextView, shouldInteractWith URL: URL, in characterRange: NSRange) -> Bool {
         
        if URL.scheme == "terms" {
            self.showWebViewController(with: "https://getir.com/yardim/kvkk/")
        }
        return true
    }
    
    func textViewDidChange(_ textView: UITextView) {
        textView.delegate = nil
        textView.selectedTextRange = nil
        textView.delegate = self
    }
    
    private func showWebViewController(with urlString: String) {
        let vc = WebViewController(with: urlString)
        let navigation = UINavigationController(rootViewController: vc)
        self.present(navigation, animated: true, completion: nil)
    }
    
}

