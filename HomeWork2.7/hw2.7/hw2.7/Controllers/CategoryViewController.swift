//
//  CategoryViewController.swift
//  hw2.7
//
//  Created by yauheni prakapenka on 20.02.2020.
//  Copyright © 2020 yauheni prakapenka. All rights reserved.
//

import UIKit

class CategoryViewController: UIViewController {
    
    @IBOutlet var tableView: UITableView!
    
    let persons = Person.getContactList()
}

extension CategoryViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        persons.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        persons[section].fullName
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        let person = persons[indexPath.section]
        
        // Вариант 1 - без иконок
        // cell.textLabel?.text = indexPath.row == 0 ? person.email : person.phoneNumber
        
        // Вариант 2 - с иконками
        switch indexPath.row {
        case 0:
            cell.textLabel?.text = person.phoneNumber
            cell.imageView?.image = UIImage(systemName: Contacts.phone.rawValue)
        default:
            cell.textLabel?.text = person.email
            cell.imageView?.image = UIImage(systemName: Contacts.email.rawValue)
        }
        
        return cell
    }
}
