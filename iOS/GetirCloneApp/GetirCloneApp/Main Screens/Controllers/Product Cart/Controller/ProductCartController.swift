//
//  ProductCartController.swift
//  GetirCloneApp
//
//  Created by Ayberk Bilgiç on 4.05.2024.
//

import UIKit
import Foundation

class ProductCartController: UIViewController {
    
    var model = ProductModel.shared
    
    let customView = CustomProductCell()
    
    // MARK: - Variables
    private let payButton = PayButton()
    
    private var images: [UIImage] = [
        UIImage(named: "dessert_bakery")!,
        UIImage(named: "dessert_cake")!,
        UIImage(named: "dessert_candy")!,
        UIImage(named: "dessert_milky")!,
    ]
    
    private var names: [String] = [
        "Kruvasan", "Pasta", "Şekerleme", "Sütlü Tatlı"
    ]
    
    private var prices: [Int] = [
        10, 20, 50, 40
    ]
    
    public var totals: [Int] = [
        1, 3, 1, 2
    ]
    
    
    
        
    // MARK: - UI Components
    private let tableView: UITableView = {
        let tableview = UITableView()
        tableview.backgroundColor = .secondarySystemBackground
        tableview.allowsSelection = true
        tableview.register(CustomProductCell.self, forCellReuseIdentifier: CustomProductCell.identifier)
        
        return tableview
    }()
    
    
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.makeOpaqueNavBar()
        self.setupUI()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        self.tableView.reloadData()
        
    }
    
    
    
    // MARK: - UI Setup
    private func setupUI() {
        self.view.backgroundColor = .systemBackground
        self.navigationItem.title = "Product Cart"
        
        self.view.addSubview(tableView)
        self.view.addSubview(payButton)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        payButton.translatesAutoresizingMaskIntoConstraints = false
        
        var sum = 0
        for x in 0..<prices.count{
           sum += prices[x]
        }
        let xNSNumber = sum as NSNumber
        let xString : String = xNSNumber.stringValue
        
        
        
        payButton.configure(with: PayButtonViewModel(primaryText: "Satın Al", priceText: "₺\(xString)"))
        
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: self.view.topAnchor),
            tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            
            payButton.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 690),
            payButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -100),
            payButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20),
            payButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
            
        ])
    }
    
   
      
    
}

extension ProductCartController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.images.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CustomProductCell.identifier, for: indexPath) as? CustomProductCell else {
            fatalError()
        }
        
        
        cell.configure(image: self.images[indexPath.row],
                       name: self.names[indexPath.row],
                       price: self.prices[indexPath.row].description,
                       total: self.model.totals[indexPath.row].description)
        
        cell.buttonActionPlus = { [weak self] in
                    self?.model.totals[indexPath.row] += 1
                    tableView.reloadRows(at: [indexPath], with: .automatic)
                }
        cell.buttonActionMinus = { [weak self] in
            if (self?.model.totals[indexPath.row])! > 0 {
                    self?.model.totals[indexPath.row] -= 1
                    tableView.reloadRows(at: [indexPath], with: .automatic)
            } else if self?.model.totals[indexPath.row] == 0 {
                self?.model.totals.remove(at: indexPath.row)
                self?.images.remove(at: indexPath.row)
                self?.names.remove(at: indexPath.row)
                self?.prices.remove(at: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: .automatic)
            } else {
                tableView.reloadRows(at: [indexPath], with: .automatic)
            }
        
        }
            
            
                  
        
        
        return cell
    }
    
    
    
    
    
}
