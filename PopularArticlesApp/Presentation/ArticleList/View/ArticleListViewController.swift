//
//  ArticleListViewController.swift
//  PopularArticlesApp
//
//  Created by Bhavi Mistry on 29/07/2021.
//

import UIKit

class ArticleListViewController: UIViewController {

    private let viewModel = ArticleListViewModel()
    private let tableView: UITableView! = nil
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
     
        setupUI()
    }
    
    private func setupUI() {
        //fetch articles
        loadData()
    }
    
    private func loadData() {
        viewModel.fetchList { success in
            print("success")
        }
    }
}

