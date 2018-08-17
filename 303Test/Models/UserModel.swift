//
//  UserModel.swift
//  303Test
//
//  Created by Roman on 8/17/18.
//  Copyright © 2018 JetSoftPro. All rights reserved.
//

import Foundation

class UserModel: Decodable {
    var firstName: String?
    var lastName: String?
    var city: String?
    
    enum Keys: String, CodingKey {
        case firstName = "fname"
        case lastName = "lname"
        case city = "city"
    }
    
    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: Keys.self)
        
        firstName = try values.decode(String.self, forKey: .firstName)
        lastName = try values.decode(String.self, forKey: .lastName)
        city = try values.decode(String.self, forKey: .city)
    }
}
