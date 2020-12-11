//
//  JsonParser.swift
//  YourDigitalLift
//
//  Created by Mac2 on 06/12/20.
//  Copyright © 2020 Mac2. All rights reserved.
//

import Foundation

struct User: Codable {
    let name: String
    let email: String
    let phone: String
    let company: Company
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case email = "email"
        case phone = "phone"
        case company = "company"
    }
}
struct Company: Codable {
    let name: String
   
    enum CodingKeys: String, CodingKey {
        case name = "name"
       
    }
}







