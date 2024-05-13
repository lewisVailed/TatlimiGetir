//
//  SearchController.swift
//  GetirCloneApp
//
//  Created by Ayberk Bilgiç on 4.05.2024.
//

import UIKit

class SearchController: UIViewController {

    // MARK: - UI Components
    private let searchController = UISearchController(searchResultsController: nil)
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.makeOpaqueNavBar()
        self.view.backgroundColor = .purple
        self.setupUI()
        self.setupSearchController()
    }
    
    // MARK: - UI Setup
    private func setupUI() {
        self.view.backgroundColor = .systemBackground
        self.navigationItem.title = "Search"

        
        NSLayoutConstraint.activate([
                
        ])
    }

    private func setupSearchController() {
        self.searchController.searchResultsUpdater = self
        self.searchController.obscuresBackgroundDuringPresentation = false
        self.searchController.hidesNavigationBarDuringPresentation = false
        self.searchController.searchBar.placeholder = "Ürün Ara"
        
        
        self.navigationItem.searchController = searchController
        self.definesPresentationContext = false
        self.navigationItem.hidesSearchBarWhenScrolling = false
                
        searchController.searchBar.backgroundColor = .secondarySystemBackground
        searchController.searchBar.searchBarStyle = .minimal
        searchController.delegate = self
        searchController.searchBar.delegate = self
        searchController.searchBar.showsBookmarkButton = false
        searchController.searchBar.setImage(UIImage(systemName: "line.horizontal.3.decrease")?.withTintColor(UIColor(red: 92/255, green: 60/255, blue: 187/255, alpha: 1), renderingMode: .alwaysOriginal), for: .bookmark, state: .normal)
        
    }

}

extension SearchController: UISearchResultsUpdating, UISearchControllerDelegate, UISearchBarDelegate  {
    
    func updateSearchResults(for searchController: UISearchController) {
        
    }
    
    func searchBarBookmarkButtonClicked(_ searchBar: UISearchBar) {
        print("Search bar button called!")
    }
}
