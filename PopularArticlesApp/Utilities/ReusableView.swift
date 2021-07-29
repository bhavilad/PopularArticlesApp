//
//  ReusableView.swift
//  PopularArticlesApp
//
//  Created by Bhavi Mistry on 29/07/2021.
//

import UIKit

protocol ReusableView {
    static var name: String { get }
}

extension ReusableView {
    static var name: String {
        return String(describing: self)
    }
}

extension UITableViewCell: ReusableView { }
