//
//  HomeWorkError.swift
//  NewProject
//
//  Created by yauheni prakapenka on 01.03.2020.
//  Copyright © 2020 yauheni prakapenka. All rights reserved.
//

enum HomeWorkError: String, Error {
    case unableToComplete = "Unable to complete request"
    case userNotFound = "User not found"
    case invalidResponse = "Invalid response"
    case invalidData = "Invalid data"
    case dataProcessingError = "Data processing error"
    case enterUsername = "Enter username"
}
