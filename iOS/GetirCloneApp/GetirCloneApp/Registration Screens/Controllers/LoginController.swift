//
//  LoginController.swift
//  GetirCloneApp
//
//  Created by Ayberk Bilgiç on 24.02.2024.
//

import UIKit

class LoginController: UIViewController {

    // MARK: - UI Components
    private let headerView = AuthHeaderView(title: "Tatlımı Getir'e Üye Ol!")
    private let usernameField = CustomTextField(fieldType: .username)
    private let passwordField = CustomTextField(fieldType: .password)
    private let emailField = CustomTextField(fieldType: .email)
    private let firstChexbox = Checkbox(isChecked: false)
    private let secondChexbox = Checkbox(isChecked: false)
    private let registerButton = CustomButton(title: "Üye Ol")
    
    private let termsTextView: UITextView = {
        let textView = UITextView()
        
        let attributedString = NSMutableAttributedString(string: "Kullanım Koşulları'nı okudum ve kabul ediyorum")
        attributedString.addAttribute(.link, value: "terms://termsOfConditions", range: (attributedString.string as NSString).range(of: "Kullanım Koşulları"))
        
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
    
    private let policyTextView: UITextView = {
        let textView = UITextView()
        
        let attributedString = NSMutableAttributedString(string: "KVKK Aydınlatma Metni kapsamında verilerimin bana özel teklifler ve kampanyalar için kullanılmasına, tarafıma ticari elektronik ileti gönderilmesine izin veriyorum")
        attributedString.addAttribute(.link, value: "privacy://privacyPolicy", range: (attributedString.string as NSString).range(of: "KVKK Aydınlatma Metni"))

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
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
        
        self.termsTextView.delegate = self
        self.policyTextView.delegate = self
        
    }
    
    // MARK: - UI Setup
    private func setupUI() {
        self.view.addSubview(headerView)
        self.view.addSubview(emailField)
        self.view.addSubview(usernameField)
        self.view.addSubview(passwordField)
        self.view.addSubview(firstChexbox)
        self.view.addSubview(secondChexbox)
        self.view.addSubview(termsTextView)
        self.view.addSubview(policyTextView)
        self.view.addSubview(registerButton)
        headerView.translatesAutoresizingMaskIntoConstraints = false
        emailField.translatesAutoresizingMaskIntoConstraints = false
        usernameField.translatesAutoresizingMaskIntoConstraints = false
        passwordField.translatesAutoresizingMaskIntoConstraints = false
        firstChexbox.translatesAutoresizingMaskIntoConstraints = false
        secondChexbox.translatesAutoresizingMaskIntoConstraints = false
        termsTextView.translatesAutoresizingMaskIntoConstraints = false
        policyTextView.translatesAutoresizingMaskIntoConstraints = false
        registerButton.translatesAutoresizingMaskIntoConstraints = false
        
        
        
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
        
        self.view.backgroundColor = .systemBackground
        self.navigationItem.title = "Üye ol"
        
        
        self.navigationController?.navigationBar.backgroundColor = UIColor(red: 92/255, green: 60/255, blue: 187/255, alpha: 1)
        self.navigationItem.largeTitleDisplayMode = .never
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "arrow.left")?.withTintColor(.white, renderingMode: .alwaysOriginal), style: .plain, target: self, action: #selector(backButtonTapped))
        

        NSLayoutConstraint.activate([
            self.headerView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            self.headerView.topAnchor.constraint(equalTo: self.view.topAnchor),
            self.headerView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.headerView.heightAnchor.constraint(equalToConstant: 160),
            
            self.usernameField.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 20),
            self.usernameField.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            self.usernameField.heightAnchor.constraint(equalToConstant: 55),
            self.usernameField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
            
            self.emailField.topAnchor.constraint(equalTo: usernameField.bottomAnchor, constant: 20),
            self.emailField.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            self.emailField.heightAnchor.constraint(equalToConstant: 55),
            self.emailField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
            
            self.passwordField.topAnchor.constraint(equalTo: emailField.bottomAnchor, constant: 20),
            self.passwordField.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            self.passwordField.heightAnchor.constraint(equalToConstant: 55),
            self.passwordField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
            
            self.firstChexbox.topAnchor.constraint(equalTo: passwordField.bottomAnchor, constant: 20),
            self.firstChexbox.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 25),
            
            self.termsTextView.leadingAnchor.constraint(equalTo: firstChexbox.trailingAnchor),
            self.termsTextView.topAnchor.constraint(equalTo: passwordField.bottomAnchor, constant: 20),
            self.termsTextView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
            
            self.secondChexbox.topAnchor.constraint(equalTo: firstChexbox.bottomAnchor),
            self.secondChexbox.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 25),
            
            self.policyTextView.leadingAnchor.constraint(equalTo: secondChexbox.trailingAnchor),
            self.policyTextView.topAnchor.constraint(equalTo: firstChexbox.bottomAnchor),
            self.policyTextView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
        
            self.registerButton.bottomAnchor.constraint(equalTo: self.view.layoutMarginsGuide.bottomAnchor),
            self.registerButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            self.registerButton.heightAnchor.constraint(equalToConstant: 50),
            self.registerButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
        ])
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.insetsLayoutMarginsFromSafeArea = false

    }
    
    @objc func backButtonTapped() {
        print("button pressed")
    }
    

}

extension LoginController: UITextViewDelegate {
     
    func textView(_ textView: UITextView, shouldInteractWith URL: URL, in characterRange: NSRange) -> Bool {
         
        if URL.scheme == "terms" {
            self.showWebViewController(with: "https://getir.com/yardim/kullanim-kosullari/")
        } else if URL.scheme == "privacy" {
            self.showWebViewController(with: "https://getir.com/yardim/kvkk/#")
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

