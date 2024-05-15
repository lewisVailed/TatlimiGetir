//
//  CustomProductCell.swift
//  GetirCloneApp
//
//  Created by Ayberk Bilgiç on 13.05.2024.
//

import UIKit

class CustomProductCell: UITableViewCell {

    static let identifier = "CustomProductCell"

    static let getirColor = UIColor(red: 92/255, green: 60/255, blue: 187/255, alpha: 1)
    
    // MARK: - UI Components
    private let productImage: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.image = UIImage(systemName: "questionmark")
        iv.tintColor = .label
        
        return iv
    }()
        
    private let productName: UILabel = {
        let name = UILabel()
        name.textColor = .label
        name.textAlignment = .left
        name.font = .systemFont(ofSize: 16, weight: .medium)
        name.text = "ürün ismi"
        return name
    }()
    
    private let productPrice: UILabel = {
        let price = UILabel()
        price.textColor = .label
        price.textAlignment = .left
        price.font = .systemFont(ofSize: 16, weight: .medium)
        price.textColor = getirColor
        price.text = "ürün fiyati"
        return price
    }()
    
    private let productMinus: UIButton = {
        let button = UIButton()
        let largeConfig = UIImage.SymbolConfiguration(pointSize: 30, weight: .bold, scale: .medium)
        let largeBoldDoc = UIImage(systemName: "minus.square.fill", withConfiguration: largeConfig)
        button.setImage(largeBoldDoc?.withTintColor(getirColor, renderingMode: .alwaysOriginal), for: .normal)
        
        return button
    }()
    
    private let productTotal: UILabel = {
        let label = UILabel(frame: CGRect(x: 50, y: 50, width: 200, height: 50))
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 20, weight: .medium)
        label.backgroundColor = .systemBackground
        label.text = "2"
        label.textColor = getirColor
        label.layer.cornerRadius = 10
        
        return label
    }()
    
    private let productPlus: UIButton = {
        let button = UIButton()
        let largeConfig = UIImage.SymbolConfiguration(pointSize: 30, weight: .bold, scale: .medium)
        let largeBoldDoc = UIImage(systemName: "plus.square.fill", withConfiguration: largeConfig)
        button.setImage(largeBoldDoc?.withTintColor(getirColor, renderingMode: .alwaysOriginal), for: .normal)
        
        return button
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configure(image: UIImage, name: String, price: String, total: String) {
        self.productImage.image = image
        self.productName.text = name
        self.productPrice.text = "₺\(price)"
        self.productTotal.text = total
    }
    
    private func setupUI() {
        self.contentView.addSubview(productImage)
        self.contentView.addSubview(productName)
        self.contentView.addSubview(productPrice)
        self.contentView.addSubview(productMinus)
        self.contentView.addSubview(productTotal)
        self.contentView.addSubview(productPlus)
        
        
        productImage.translatesAutoresizingMaskIntoConstraints = false
        productName.translatesAutoresizingMaskIntoConstraints = false
        productPrice.translatesAutoresizingMaskIntoConstraints = false
        productMinus.translatesAutoresizingMaskIntoConstraints = false
        productTotal.translatesAutoresizingMaskIntoConstraints = false
        productPlus.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            productImage.topAnchor.constraint(equalTo: self.contentView.layoutMarginsGuide.topAnchor),
            productImage.bottomAnchor.constraint(equalTo: self.contentView.layoutMarginsGuide.bottomAnchor),
            productImage.leadingAnchor.constraint(equalTo: self.contentView.layoutMarginsGuide.leadingAnchor),
            productImage.heightAnchor.constraint(equalToConstant: 80),
            productImage.widthAnchor.constraint(equalToConstant: 80),
        
            productName.leadingAnchor.constraint(equalTo: self.productImage.trailingAnchor, constant: 16),
            productName.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            productName.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -55),
            
            productPrice.topAnchor.constraint(equalTo: self.productName.bottomAnchor, constant: 10),
            productPrice.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 116),
            
            productMinus.trailingAnchor.constraint(equalTo: self.productName.leadingAnchor, constant: 190),
            productMinus.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -35),
            
            productTotal.leadingAnchor.constraint(equalTo: self.productMinus.leadingAnchor, constant: 42),
            productTotal.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -39),
            
            productPlus.trailingAnchor.constraint(equalTo: self.productName.leadingAnchor, constant: 250),
            productPlus.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -35),

            
        ])
    }
}
