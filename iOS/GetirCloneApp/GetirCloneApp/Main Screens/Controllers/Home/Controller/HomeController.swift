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
    
    private var collectionView: UICollectionView?
    
    private let titles: [String] = ["Bakery", "Cake", "Candy", "Chocolate", "Icecream", "Milky", "Snack", "Syrupy"]
    private let images: [String] = ["dessert_bakery", "dessert_cake", "dessert_candy", "dessert_chocolate", "dessert_icecream", "dessert_milky", "dessert_snack", "dessert_syrupy"]
    
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

        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: 100, height: 100)
        layout.minimumInteritemSpacing = 20
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        guard let collectionView = collectionView else {
            return
        }
        collectionView.register(CustomCollectionViewCell.self, forCellWithReuseIdentifier: CustomCollectionViewCell.identifier)
        
        view.addSubview(tableView)
        view.addSubview(collectionView)
        
        collectionView.dataSource = self
        collectionView.delegate = self
        tableView.dataSource = self
        tableView.delegate = self
        
        collectionView.frame = CGRect(x: 20, y: 320, width: 350, height: 500)
        
        NSLayoutConstraint.activate([
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

extension HomeController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return titles.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCollectionViewCell.identifier, for: indexPath) as? CustomCollectionViewCell else { fatalError() }
        cell.configure(label: titles[indexPath.row], image: images[indexPath.row])
    
        return cell
    }
    
    
}
