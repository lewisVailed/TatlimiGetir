//
//  HomeController.swift
//  GetirCloneApp
//
//  Created by Ayberk Bilgiç on 4.05.2024.
//

import UIKit

class HomeController: UIViewController {

    private let tableView: UITableView = {
        let table = UITableView()
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
        self.makeOpaqueNavBar()
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
    
    // MARK: - UI Setup
    private func setupUI() {
        
        self.view.backgroundColor = .systemBackground
        self.navigationItem.title = "Home"
        
        self.view.addSubview(tableView)
        tableView.dataSource = self
        
        NSLayoutConstraint.activate([
            
        ])
    }
}

extension HomeController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "HELLO"
        return cell
    }
}
