//
//  TableViewSectionData.swift
//  Woodpecker
//

import Foundation

/// A sections data in the table view.
public struct TableViewSectionData {
    /// The rows data in the table view.
    public private(set) var rows: [TableViewDataSourceItem]
    
    /// Creates a section data of the table view.
    /// - Parameter rows: The rows data in the table view.
    public init(rows: [TableViewDataSourceItem]) {
        self.rows = rows
    }
    
    /// Adds an item to the end of the section.
    /// - Parameter item: The item to append to the section.
    mutating func append(_ item: TableViewDataSourceItem) {
        self.rows.append(item)
    }
    
    
}
