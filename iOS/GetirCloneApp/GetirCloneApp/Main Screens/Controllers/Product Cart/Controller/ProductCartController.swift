//
//  ProductCartController.swift
//  GetirCloneApp
//
//  Created by Ayberk Bilgiç on 4.05.2024.
//

import UIKit

class ProductCartController: UIViewController {
    
    // MARK: - Variables
    private let payButton = PayButton()
    
    private let images: [UIImage] = [
        UIImage(named: "dessert_bakery")!,
        UIImage(named: "dessert_cake")!,
        UIImage(named: "dessert_candy")!,
        UIImage(named: "dessert_milky")!,
    ]
    
    private let names: [String] = [
        "Kruvasan", "Pasta", "Şekerleme", "Sütlü Tatlı"
    ]
    
    private let prices: [String] = [
        "60", "240", "17", "128"
    ]
    
    private let totals: [String] = [
        "1", "3", "1", "2"
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
    }
    
    // MARK: - UI Setup
    private func setupUI() {
        self.view.backgroundColor = .systemBackground
        self.navigationItem.title = "Product Cart"
        
        self.view.addSubview(tableView)
        self.view.addSubview(payButton)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        payButton.translatesAutoresizingMaskIntoConstraints = false
        
        payButton.configure(with: PayButtonViewModel(primaryText: "Satın Al", priceText: "₺445"))
        
        
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
                       price: self.prices[indexPath.row],
                       total: self.totals[indexPath.row])
        return cell
    }
    
    
    
    
}
