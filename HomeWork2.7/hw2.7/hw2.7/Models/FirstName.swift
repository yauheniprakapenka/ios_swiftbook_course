//
//  FirstName.swift
//  hw2.7
//
//  Created by yauheni prakapenka on 19.02.2020.
//  Copyright © 2020 yauheni prakapenka. All rights reserved.
//

struct FirstName {
    var firstName: String
}

extension FirstName {
    static func getFirstNames() -> [FirstName] {
        [FirstName(firstName: "Nelson"),
        FirstName(firstName: "Winston"),
        FirstName(firstName: "Donald"),
        FirstName(firstName: "Bill"),
        FirstName(firstName: "Charles"),
        FirstName(firstName: "Elvis"),
        FirstName(firstName: "Albert"),
        FirstName(firstName: "Thomas"),
        FirstName(firstName: "Rosa"),
        FirstName(firstName: "Eva")]
    }
}
