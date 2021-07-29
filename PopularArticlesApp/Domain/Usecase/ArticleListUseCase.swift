//
//  ArticleListUseCase.swift
//  PopularArticlesApp
//
//  Created by Bhavi Mistry on 29/07/2021.
//

import Foundation

final class ArticleListUseCase: BaseUseCase<ArticleListModel> {
    
    private var articleRepository: ArticleRepository!
    
    init(repository: ArticleRepository = ArticleRepository()) {
        self.articleRepository = repository
    }
    
    override func execute(onCompletion: @escaping (Result<ArticleListModel?, NetworkError>) -> Void) {
        articleRepository.fetch { response in
            onCompletion(response)
        }
    }
}
