//
//  ArticleListTests.swift
//  PopularArticlesAppTests
//
//  Created by Bhavi Mistry on 29/07/2021.
//

import XCTest
@testable import PopularArticlesApp

final class ArticleListTests: XCTestCase {

    private var mockNetwork: MockNetworkAdaptor!
    private var repository: ArticleRepository!
    
    override func setUp() {
        super.setUp()
        
        //preparing mock network with json response
        mockNetwork = MockNetworkAdaptor(fileName: "mock_articleList")
        //initializing repo with mock network adaptor
        repository = ArticleRepository(networkManager: mockNetwork)
    }
    
    func testArticleListApi() {
        repository.fetch { response in
            switch response {
            case .success(let articles):
                XCTAssert(articles?.numResults == 3)
                XCTAssertTrue(articles?.results.isEmpty == false)
                
                let firstArticle = articles?.results.first!
                XCTAssertTrue(firstArticle!.id == 100000007873785)
                XCTAssertNotNil(firstArticle!.url != nil)
                
            case .failure(_):
                XCTFail("Article List Test Fail.")
            }
        }
    }
    
    func testArticleListApiWithNoResult() {
        mockNetwork = MockNetworkAdaptor(fileName: "mock_articleList_noResult")
        repository = ArticleRepository(networkManager: mockNetwork)
        
        repository.fetch { response in
            switch response {
            case .success(let articles):
                XCTAssert(articles?.numResults == 0)
                XCTAssertTrue(articles!.results.isEmpty)
                
            case .failure(_):
                XCTFail("Article List Test Fail.")
            }
        }
    }
}
