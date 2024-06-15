//
//  ProductModel.swift
//  GetirCloneApp
//
//  Created by Ayberk Bilgiç on 20.05.2024.
//

import Foundation

struct ProductModel {
    public var totals: [Int] = [1, 3, 1, 2]
    
    
    public var changeButton : Bool = false
    
    
    static let shared = ProductModel()
    
    
}


