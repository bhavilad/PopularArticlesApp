//
//  ArticleListViewController.swift
//  PopularArticlesApp
//
//  Created by Bhavi Mistry on 29/07/2021.
//

import UIKit

class ArticleListViewController: UIViewController {

    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private var activityIndicator: UIActivityIndicatorView!
    
    let viewModel = ArticleListViewModel()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
     
        self.title = "Popular Articles"
        setupUI()
    }
    
    private func setupUI() {
        //fetch articles
        activityIndicator.startAnimating()
        loadData()
    }
    
    private func registerCell() {
        tableView.register(UINib(nibName: ArticleTableViewCell.name, bundle: nil), forCellReuseIdentifier: ArticleTableViewCell.name)
    }
    
    private func loadData() {
        viewModel.fetchList { [weak self] (success, error) in
            self?.activityIndicator.stopAnimating()
            self?.tableView.isHidden = !success
            if success {
                self?.tableView.reloadData()
            } else {
                self?.showAlert(error)
            }
        }
    }
    
    private func showAlert(_ error: NetworkError?) {
        var errorMessage = ""
        switch error {
        case .custom(let error):
            errorMessage = error
        case .error(let error):
            errorMessage = error.rawValue
        case .none:
            errorMessage = ""
        }
        let alert = UIAlertController(title: "Alert", message: errorMessage, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}

