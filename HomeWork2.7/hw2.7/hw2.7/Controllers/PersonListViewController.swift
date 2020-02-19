//
//  ViewController.swift
//  hw2.7
//
//  Created by yauheni prakapenka on 19.02.2020.
//  Copyright © 2020 yauheni prakapenka. All rights reserved.
//

import UIKit

class PersonListViewController: UIViewController {
    
    // MARK: - IBOutlets
    
    @IBOutlet var tableView: UITableView!
    
    // MARK: - Private properties
    
    private let firstName = FirstName.getFirstNames()
    private let lastName = LastName.getLastNames()
    
}

extension PersonListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        firstName.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = firstName[indexPath.row].firstName + " " + lastName[indexPath.row].lastName
        
        return cell
    }
}

