//
//  ArticleListViewModel.swift
//  PopularArticlesApp
//
//  Created by Bhavi Mistry on 29/07/2021.
//

import Foundation

final class ArticleListViewModel {
    
    private var listUseCase: ArticleListUseCase!
    private var articleList: [Article?] = []
    
    init(useCase: ArticleListUseCase = ArticleListUseCase()) {
        self.listUseCase =  useCase
    }
    
    var numberOfRows: Int {
        articleList.count
    }
    
    func articleForRow(at row: Int) -> Article? {
        return articleList[row]
    }
    
    func fetchList(onCompletion: @escaping ((Bool, NetworkError?) -> Void)) {
        listUseCase.execute { response in
            switch response {
            case .success(let articles):
                self.articleList = articles?.results ?? []
                onCompletion(true, nil)
            case .failure(let error):
                onCompletion(false, error)
            }
        }
    }
}
