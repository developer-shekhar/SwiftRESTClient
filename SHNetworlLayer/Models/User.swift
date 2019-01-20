//
//  User.swift
//  SHNetworlLayer
//
//  Created by shashi on 1/19/19.
//  Copyright © 2019 shashi. All rights reserved.
//

import Foundation

struct User: Codable {
    let authToken: String!
    let userID: Int!
    let forename, surname, email, username: String!
    let clientID, gangID: Int!
    let gangRef: String!
    let engineerID: Int!
    let errorCode : Int!
    let errorMessage: String!
    let isTm: Bool!
    let roleID: Int!
    let roleName: String!
    
    
    enum CodingKeys: String, CodingKey {
        case authToken = "AuthToken"
        case userID = "UserID"
        case forename = "Forename"
        case surname = "Surname"
        case email = "Email"
        case username = "Username"
        case clientID = "ClientID"
        case gangID = "GangID"
        case gangRef = "GangRef"
        case engineerID = "EngineerID"
        case errorCode = "ErrorCode"
        case errorMessage = "ErrorMessage"
        case isTm = "IsTm"
        case roleID = "RoleID"
        case roleName = "RoleName"
    }
}
