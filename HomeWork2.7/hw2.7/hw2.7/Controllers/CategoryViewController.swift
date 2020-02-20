//
//  CategoryViewController.swift
//  hw2.7
//
//  Created by yauheni prakapenka on 20.02.2020.
//  Copyright © 2020 yauheni prakapenka. All rights reserved.
//

import UIKit

struct NewPerson {
    var firstName: String
    var lastName: String
    var phone: String
    var email: String
    
    static func getPerson() -> [NewPerson] {
        [NewPerson(firstName: "Bill", lastName: "Talent", phone: "1@1,by", email: "12345"),
         NewPerson(firstName: "Tom", lastName: "Jones", phone: "2@2.by", email: "12345"),
         NewPerson(firstName: "Adam", lastName: "Lambert", phone: "3@3.by", email: "1312312")]
    }
}

class CategoryViewController: UIViewController {
    
    @IBOutlet var tableView: UITableView!
    
    let person = NewPerson.getPerson()
}

extension CategoryViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = "123"
        
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        person.count
    }
    
    
}
