//
//  ViewController.swift
//  DemoSwiftInstagram
//
//  Created by Dzionis Brek on 13.10.2017.
//  Copyright © 2017 Dzionis Brek. All rights reserved.
//

import UIKit
import SwiftInstagram

class MediaViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var items: [InstagramMedia] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let api = Instagram.shared
        
        api.recentMedia(fromUser: "self", count: 30, success: { (mediaSet) in
            self.items.removeAll()
            self.items.append(contentsOf: mediaSet)
            self.tableView.reloadData()
            
        }, failure: { (error) in
            print(error.localizedDescription)
        })
    }
}

extension MediaViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: InstaMediaTableViewCell = tableView.dequeueReusableCell(withIdentifier: String(describing: InstaMediaTableViewCell.self), for: indexPath) as! InstaMediaTableViewCell
        cell.fill(with: items[indexPath.row])
        return cell
    }
}
