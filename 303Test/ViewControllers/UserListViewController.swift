//
//  ViewController.swift
//  303Test
//
//  Created by Roman on 8/17/18.
//  Copyright © 2018 JetSoftPro. All rights reserved.
//

import UIKit

class UserListViewController: UITableViewController {
    var dataSource = [UserModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UserRepository.shared.getAll { users, err in
            
            guard err == nil, let userList = users else {
                self.makeAlert(Constants.alertMessage)
                return
            }
            
            self.dataSource = userList
            DispatchQueue.main.async {
                self.tableView.reloadSections(IndexSet(integer: 0), with: UITableViewRowAnimation.right)
            }
        }
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PersonCell")
        let user = dataSource[indexPath.row]
        
        cell?.textLabel?.text = user.firstName! + " " + user.lastName!
        cell?.detailTextLabel?.text = user.city!
        
        return cell!;
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
}

