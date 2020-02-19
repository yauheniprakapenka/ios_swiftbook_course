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
    
    var person = Person(firstName: firstName.shuffled(),
                        lastName: lastName.shuffled(),
                        email: email.shuffled(),
                        phones: phone.shuffled())
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detailVC" {
            let detailVC = segue.destination as! DetailViewController
            detailVC.person = sender as? Person
        }
    }
}

// MARK: - Table View Data Source

extension PersonListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        firstName.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = person.firstName[indexPath.row] + " " + person.lastName[indexPath.row]
        
        return cell
    }
}

// MARK: - Table View Data Source

extension PersonListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let currentPerson = Person(firstName: [person.firstName[indexPath.row]],
                                   lastName: [person.lastName[indexPath.row]],
                                   email: [person.email[indexPath.row]],
                                   phones: [person.phones[indexPath.row]])
        
        performSegue(withIdentifier: "detailVC", sender: currentPerson)
    }
}
