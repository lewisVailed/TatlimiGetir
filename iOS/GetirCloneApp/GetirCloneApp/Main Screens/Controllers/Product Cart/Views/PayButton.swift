//
//  PayButton.swift
//  GetirCloneApp
//
//  Created by Ayberk Bilgiç on 13.05.2024.
//

import UIKit

struct PayButtonViewModel {
    let primaryText: String
    let priceText: String
}

final class PayButton: UIButton {
    
    static let getirColor = UIColor(red: 92/255, green: 60/255, blue: 187/255, alpha: 1)
    
    private let primaryLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.backgroundColor = getirColor
        label.textAlignment = .center
        label.numberOfLines = 1
        label.font = .systemFont(ofSize: 16, weight: .bold)
        return label
    }()
    
    private let priceLabel: UILabel = {
        let label = UILabel()
        label.textColor = getirColor
        label.backgroundColor = .white
        label.textAlignment = .center
        label.numberOfLines = 1
        label.font = .systemFont(ofSize: 20, weight: .bold)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(primaryLabel)
        self.addSubview(priceLabel)
        self.clipsToBounds = true
        
        self.layer.cornerRadius = 16
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with viewModel: PayButtonViewModel) {
        primaryLabel.text = viewModel.primaryText
        priceLabel.text = viewModel.priceText
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        primaryLabel.frame = CGRect(x: 0, y: 0, width: 240, height: Int(frame.size.height))
        priceLabel.frame = CGRect(x: 240, y: 0, width: 130, height: Int(frame.size.height))
    }
    
}
