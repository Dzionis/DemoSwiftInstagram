//
//  ModulsTableViewController.swift
//  DemoSwiftInstagram
//
//  Created by Dzionis Brek on 13.10.2017.
//  Copyright © 2017 Dzionis Brek. All rights reserved.
//

import UIKit
import SwiftInstagram

class ModulsTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        updateNavigationBar()
    }
    
    private func updateNavigationBar() {
        if Instagram.shared.isSessionValid() {
            let logoutButton = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(logout))
            navigationItem.rightBarButtonItem = logoutButton
        } else {
            let loginButton = UIBarButtonItem(title: "Login", style: .plain, target: self, action: #selector(login))
            navigationItem.rightBarButtonItem = loginButton
        }
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if Instagram.shared.isSessionValid() {
            return true
        } else {
            let alertController = UIAlertController.init(title: "Warning", message: "You are not loggin in. Do you want loggin now?", preferredStyle: .alert)
            let loginAction = UIAlertAction.init(title: "Login", style: .default, handler: { (action) in
                self.login()
            })
            let cancelAction = UIAlertAction.init(title: "Cancel", style: .cancel, handler: nil)
            alertController.addAction(loginAction)
            alertController.addAction(cancelAction)
            present(alertController, animated: true, completion: nil)
            if let indexPath = tableView.indexPathForSelectedRow {
                tableView.deselectRow(at: indexPath, animated: true)
            }
            return false
        }
    }
    
    @objc private func login() {
        let api = Instagram.shared
        
        // Login
        if !api.isSessionValid() {
            api.login(navController: navigationController!, scopes: [.basic, .likes, .followerList, .publicContent], success: {
                self.updateNavigationBar()
            }, failure: { error in
                print(error.localizedDescription)
            })
        }
        
    }
    
    @objc private func logout() {
        Instagram.shared.logout()
        self.updateNavigationBar()
    }
}
