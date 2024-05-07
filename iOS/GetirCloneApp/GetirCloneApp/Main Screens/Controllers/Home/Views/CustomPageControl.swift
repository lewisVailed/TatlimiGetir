//
//  CustomPageControl.swift
//  GetirCloneApp
//
//  Created by Ayberk Bilgiç on 7.05.2024.
//

import UIKit

final class CustomPageControl: UIPageControl {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func configure() {
        currentPageIndicatorTintColor = .black
        pageIndicatorTintColor = .systemGray
    }
}
