//
//  ArticleRepository.swift
//  PopularArticlesApp
//
//  Created by Bhavi Mistry on 29/07/2021.
//

import Foundation

final class ArticleRepository: BaseRepository {
   
    func fetch(onCompletion: @escaping (Result<ArticleListModel?, NetworkError>) -> Void) {
        //api call
        networkManager.process(APIInventory.articleListAPI, for: ArticleListModel.self) { response in
            onCompletion(response)
        }
    }
}
