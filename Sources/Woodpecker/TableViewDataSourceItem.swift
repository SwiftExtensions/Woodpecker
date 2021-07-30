//
//  TableViewDataSourceItem.swift
//  Woodpecker
//

import UIKit

/// The data source Item protocol of the table view.
public protocol TableViewDataSourceItem {
    /// The reuse identifier for the cell. This parameter must not be nil and must not be an empty string.
    func cellIdentifier() -> String
    /// Configurates cell for the item of the table view.
    /// - Parameter cell: The table view cell to configurate&
    func setupCell(_ cell: UITableViewCell) -> UITableViewCell
    
    
}
