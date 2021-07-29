//
//  ArticleListViewController.swift
//  PopularArticlesApp
//
//  Created by Bhavi Mistry on 29/07/2021.
//

import UIKit

class ArticleListViewController: UIViewController {

    @IBOutlet private weak var tableView: UITableView!
    
    let viewModel = ArticleListViewModel()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
     
        self.title = "Popular Articles"
        setupUI()
    }
    
    private func setupUI() {
        //fetch articles
        loadData()
    }
    
    private func registerCell() {
        tableView.register(UINib(nibName: ArticleTableViewCell.name, bundle: nil), forCellReuseIdentifier: ArticleTableViewCell.name)
    }
    
    private func loadData() {
        viewModel.fetchList { [weak self] success in
            self?.tableView.reloadData()
        }
    }
}

