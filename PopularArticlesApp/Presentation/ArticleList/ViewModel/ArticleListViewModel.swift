//
//  ArticleListViewModel.swift
//  PopularArticlesApp
//
//  Created by Bhavi Mistry on 29/07/2021.
//

import Foundation

final class ArticleListViewModel {
    
    private var listUseCase: ArticleListUseCase!
    private var articleList: ArticleListModel?
    
    init(useCase: ArticleListUseCase = ArticleListUseCase()) {
        self.listUseCase =  useCase
    }
    
    func fetchList(onCompletion: @escaping ((Bool) -> Void)) {
        listUseCase.execute { response in
            switch response {
            case .success(let articles):
                self.articleList = articles
                onCompletion(true)
            case .failure(let error):
                // TODO
                onCompletion(false)
            }
        }
    }
}
