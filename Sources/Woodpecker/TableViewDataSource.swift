//
//  TableViewDataSource.swift
//  Woodpecker
//

import UIKit

/// A data manager for the table view data source.
public class TableViewDataSource: NSObject {
    /// A view that presents data.
    public private(set) weak var tableView: UITableView?
    /// A sections data in the table view.
    public private(set) var sections: [TableViewSectionData]
    
    /// Initialize a new table view data source.
    /// - Parameters:
    ///   - tableView: A view that presents data.
    ///   - sections: A sections data in the table view.
    public init(tableView: UITableView, sections: [TableViewSectionData]) {
        self.tableView = tableView
        self.sections = sections
        
        super.init()
        
        tableView.dataSource = self
    }
    
    /// Registers a class for use in creating new table cells.
    /// - Parameters:
    ///   - cellClass: The class of a cell that you want to use in the table (must be a UITableViewCell subclass).
    ///   - identifier: The reuse identifier for the cell. This parameter must not be nil and must not be an empty string.
    public func register(_ cellClass: AnyClass?, forCellReuseIdentifier identifier: String) {
        self.tableView?.register(cellClass, forCellReuseIdentifier: identifier)
    }
    
    /// Adds an item to the end of the selected section of the data source and inserts row in the table view, with an option to animate the insertion.
    /// - Parameters:
    ///   - item: The item to append to the section.
    ///   - section: The number of section in the table view.
    ///   - animation: A constant that either specifies the kind of animation to perform when inserting the cell or requests no animation.
    ///   See UITableView.RowAnimation for descriptions of the constants.
    public func append(_ item: TableViewDataSourceItem, inSection section: Int, with animation: UITableView.RowAnimation) {
        self.sections[section].append(item)
        self.tableView?.insertRows(at: [IndexPath(row: self.sections[section].rows.count - 1, section: section)], with: animation)
    }
    
    
}

// MARK: - UITableViewDataSource

extension TableViewDataSource: UITableViewDataSource {
    public func numberOfSections(in tableView: UITableView) -> Int {
        self.sections.count
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.sections[section].rows.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = self.sections[indexPath.section].rows[indexPath.row]
        let identifier = item.cellIdentifier()
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
        
        return item.setupCell(cell)
    }
    
    
}
