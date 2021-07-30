//
//  TableViewSectionData.swift
//  Woodpecker
//

import Foundation

public struct TableViewSectionData {
    public private(set) var rows: [TableViewDataSourceItem]
    
    public init(rows: [TableViewDataSourceItem]) {
        self.rows = rows
    }
    
    mutating func append(_ item: TableViewDataSourceItem) {
        self.rows.append(item)
    }
    
    
}
