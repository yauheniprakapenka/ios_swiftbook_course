//
//  DetailViewController.swift
//  hw2.7
//
//  Created by yauheni prakapenka on 19.02.2020.
//  Copyright © 2020 yauheni prakapenka. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    // MARK: - IBOutlets
    
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var userEmail: UILabel!
    @IBOutlet var userPhoneLabel: UILabel!
    
    // MARK: - Public properties
    
    var person: Person!
    
    // MARk: - View Controller Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = person.firstName.first!  + " " + person.lastName.first!
        userEmail.text = person.email.first!
        userPhoneLabel.text = person.phones.first!
    }
}
