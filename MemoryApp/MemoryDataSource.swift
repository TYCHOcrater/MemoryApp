//
//  MemoryDataSource.swift
//  MemoryApp
//
//  Created by aoi haru on 2/13/19.
//  Copyright © 2019 aoi haru. All rights reserved.
//

import UIKit

class MemoryDataSource: NSObject, UITableViewDataSource {
    var items = [memoryItem]()
    
    
    override init() {
        guard let url = Bundle.main.url(forResource: "MemoryItems", withExtension: "json") else {
            fatalError("Can't find JSON")
        }
        
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Undable to load JSON")
        }
        
        let decoder = JSONDecoder()
        
        guard let savedItems = try? decoder.decode([memoryItem].self, from: data) else {
            fatalError("Failed to decode JSON")
        }
        
        items = savedItems
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = items[indexPath.row]
        
        let cell = tableView .dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        cell.textLabel?.text = item.title
        cell.detailTextLabel?.text = item.text
        
        return cell
    }
    
    func item(at index: Int) -> memoryItem {
        return items[index]
        
    }
}
