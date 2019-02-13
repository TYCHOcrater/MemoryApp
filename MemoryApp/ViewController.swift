//
//  ViewController.swift
//  MemoryApp
//
//  Created by aoi haru on 2/13/19.
//  Copyright © 2019 aoi haru. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    let dataSource = MemoryDataSource()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = dataSource
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "MemoryViewController") as? MemoryViewController else {
            fatalError("Unable to instantiate memory view controller")
        }
        
        let item = dataSource.item(at: indexPath.row)
        vc.item = item
        
        navigationController?.pushViewController(vc, animated: true)
    }
}

