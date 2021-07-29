//
//  ArticleListViewController+UITableview.swift
//  PopularArticlesApp
//
//  Created by Bhavi Mistry on 29/07/2021.
//

import UIKit

extension ArticleListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.numberOfRows
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
}

extension ArticleListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ArticleTableViewCell.name) as? ArticleTableViewCell else {
            return UITableViewCell()
        }
        let item = viewModel.articleForRow(at: indexPath.row)
        cell.configure(item, at: indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = viewModel.articleForRow(at: indexPath.row)
        performSegue(withIdentifier: "DetailSegue", sender: item?.url)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "DetailSegue" {
            guard let vc = segue.destination as? ArticleDetailViewController,
                  let url = sender as? String else {
                return
            }
            vc.webURL = url
        }
    }
}
