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
        table.register(CollectionTableViewCell.self, forCellReuseIdentifier: CollectionTableViewCell.identifier)
        return table
    }()
    
    private let headerViewHome = AuthHeaderView(title: "Tatlımı Getir'e Giriş Yap!")
    
    private let viewModels: [CollectionTableViewCellViewModel] = [
        CollectionTableViewCellViewModel(viewModels: [
            TileCollectionViewCellViewModel(imageName: "slipper1" , backgroundColor: .clear),
            TileCollectionViewCellViewModel(imageName: "slipper2" , backgroundColor: .clear),
            TileCollectionViewCellViewModel(imageName: "slipper3" , backgroundColor: .clear),
            TileCollectionViewCellViewModel(imageName: "slipper4" , backgroundColor: .clear),
            TileCollectionViewCellViewModel(imageName: "slipper5" , backgroundColor: .clear)
        
        ])
    
    ]
    
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
        
        view.addSubview(headerViewHome)
        view.addSubview(tableView)
        

        tableView.dataSource = self
        tableView.delegate = self
        
        NSLayoutConstraint.activate([
            self.headerViewHome.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            self.headerViewHome.topAnchor.constraint(equalTo: self.view.topAnchor),
            self.headerViewHome.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            
            

        ])
    }
}

extension HomeController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let viewModel = viewModels[indexPath.row]
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CollectionTableViewCell.identifier, for: indexPath) as? CollectionTableViewCell else {
            fatalError()
        }
        cell.configure(with: viewModel)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return view.frame.size.width/2
    }
}
