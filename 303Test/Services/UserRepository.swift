//
//  UserRepository.swift
//  303Test
//
//  Created by Roman on 8/17/18.
//  Copyright © 2018 JetSoftPro. All rights reserved.
//

import Foundation

final class UserRepository {
    private init() {
    }
    
    static let shared = UserRepository()
    
    func getAll(completionHandler: @escaping (_ data: [UserModel]?,_ error: Error?) -> Void) {
        let url = URL(string: Endpoints.getAllUsers)
        
        let task = URLSession.shared.dataTask(with: url!) { (data, _, err) in
            if let error = err {
                completionHandler(nil, error)
            }
            
            guard let data = data else {
                completionHandler(nil, nil)
                return
            }
            
            let users = self.decodeData(data)
            completionHandler(users, nil)
        }
        
        task.resume()
    }
    
    private func decodeData(_ data: Data) -> [UserModel] {
        let decodedUsers = try? JSONDecoder().decode([UserModel].self, from: data)
        
        if let users = decodedUsers {
            return users
        } else {
            return []
        }
    }
} 
