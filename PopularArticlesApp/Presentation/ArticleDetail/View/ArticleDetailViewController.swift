//
//  ArticleDetailViewController.swift
//  PopularArticlesApp
//
//  Created by Bhavi Mistry on 29/07/2021.
//

import UIKit
import WebKit

class ArticleDetailViewController: UIViewController {
    
    @IBOutlet private var webView: WKWebView!
    @IBOutlet private var activityIndicator: UIActivityIndicatorView!
    
    var webURL = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Details"
        loadDetails()
    }
    
    private func loadDetails() {
        guard let url = URL(string: webURL) else {
            return
        }
        activityIndicator.startAnimating()
        webView.navigationDelegate = self
        webView.load(URLRequest(url: url))
    }
}

extension ArticleDetailViewController: WKNavigationDelegate {
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        activityIndicator.stopAnimating()
    }
    
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        activityIndicator.stopAnimating()
    }
}
