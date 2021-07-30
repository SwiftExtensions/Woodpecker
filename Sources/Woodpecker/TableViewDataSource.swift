//
//  TableViewDataSource.swift
//  Woodpecker
//

import UIKit

public class TableViewDataSource: NSObject {
    public private(set) weak var tableView: UITableView?
    public private(set) var sections: [TableViewSectionData]
    
    public init(tableView: UITableView, sections: [TableViewSectionData]) {
        self.tableView = tableView
        self.sections = sections
        
        super.init()
        
        tableView.dataSource = self
    }
    
    public func register(cellClass: AnyClass) {
        self.tableView?.register(cellClass, forCellReuseIdentifier: "\(cellClass)")
    }
    
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "\(type(of: item).cellClass)", for: indexPath)
        
        return item.setupCell(cell)
    }
    
    
}
