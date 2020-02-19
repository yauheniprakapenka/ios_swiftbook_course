//
//  LastName.swift
//  hw2.7
//
//  Created by yauheni prakapenka on 19.02.2020.
//  Copyright © 2020 yauheni prakapenka. All rights reserved.
//

struct LastName {
    var lastName: String
}

extension LastName {
    static func getLastNames() -> [LastName] {
        [LastName(lastName: "Monroe"),
        LastName(lastName: "Mandela"),
        LastName(lastName: "Kennedy"),
        LastName(lastName: "Trump"),
        LastName(lastName: "Einstein"),
        LastName(lastName: "Teresa"),
        LastName(lastName: "Presley"),
        LastName(lastName: "Vinci"),
        LastName(lastName: "Parks"),
        LastName(lastName: "Johnson")]
    }
}

