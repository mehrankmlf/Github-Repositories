//
//  TableViewDataSource.swift
//  GithubRepository
//
//  Created by Mehran on 3/26/1401 AP.
//

import UIKit
import Combine

class TableViewCustomDataSource<Model>: NSObject,UITableViewDataSource {
    
    typealias CellConfigurator = (Model,UITableViewCell)-> Void
    
    var models:[Model]?
    @Published var loadNextPage = false
    private let reuseIdentifier:String
    private let cellConfigurator: CellConfigurator
    
    init(models:[Model],reuseIdentifier:String,cellConfigurator:@escaping CellConfigurator) {
        
        self.models = models
        self.reuseIdentifier = reuseIdentifier
        self.cellConfigurator = cellConfigurator
    }
        
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let count = models?.count else {return 0}
        return count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let data = self.models else {return UITableViewCell()}
        let model = data[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath)
        cellConfigurator(model,cell)
        return cell
    }
}

extension TableViewCustomDataSource where Model == Repository {
    static func displayData(for itemLists:[Repository],withCellidentifier reuseIdentifier: String)-> TableViewCustomDataSource {
        return TableViewCustomDataSource(models: itemLists, reuseIdentifier: reuseIdentifier, cellConfigurator: { (data, cell ) in
            let itemcell:MainTableViewCell = cell as! MainTableViewCell
            itemcell.setupParameters(data: data)
        })
    }
}
