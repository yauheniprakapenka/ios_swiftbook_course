//
//  User.swift
//  NewProject
//
//  Created by yauheni prakapenka on 01.03.2020.
//  Copyright © 2020 yauheni prakapenka. All rights reserved.
//

struct User: Decodable {
    var login: String
    var avatarUrl: String // установлено decoder.keyDecodingStrategy = .convertFromSnakeCase
    var followers: Int
}
