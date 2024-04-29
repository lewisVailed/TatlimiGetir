//
//  Checkbox.swift
//  GetirCloneApp
//
//  Created by Ayberk Bilgiç on 29.04.2024.
//

import UIKit

class Checkbox: UIView {

    public var checked: Bool = false
    
    public var image: UIImage? {
        let image = UIImage(systemName: "checkmark.square.fill")
        return checked ? UIImage(systemName: "checkmark.square.fill") : UIImage(systemName: "square")
    }
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = .white
        
    //    imageView.image = self.image
        
        return imageView
    }()
    
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setup()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        let imageView = UIImageView()
        self.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            imageView.topAnchor.constraint(equalTo: topAnchor)
        ])
        
        imageView.image = image
        
    }
}
