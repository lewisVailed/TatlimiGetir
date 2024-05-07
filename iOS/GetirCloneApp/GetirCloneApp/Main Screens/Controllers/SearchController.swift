//
//  SearchController.swift
//  GetirCloneApp
//
//  Created by Ayberk Bilgiç on 4.05.2024.
//

import UIKit

class SearchController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.makeOpaqueNavBar()
        self.view.backgroundColor = .purple
        self.setupUI()
    }
    
    // MARK: - UI Setup
    private func setupUI() {
        self.view.backgroundColor = .systemBackground
        self.navigationItem.title = "Search"
        
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
