//
//  TableViewDataSourceItem.swift
//  Woodpecker
//

import UIKit

public protocol TableViewDataSourceItem {
    static var cellClass: AnyClass { get }
    
    func setupCell(_ cell: UITableViewCell) -> UITableViewCell
    
    
}
