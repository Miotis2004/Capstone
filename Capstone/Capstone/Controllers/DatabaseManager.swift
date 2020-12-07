//
//  DatabaseManager.swift
//  Capstone
//
//  Created by Ronald Joubert on 12/7/20.
//

import Foundation
import FirebaseDatabase

final class DatabaseManager {
    static let shared = DatabaseManager()
    
    private let database = Database.database().reference()
    
    
}

extension DatabaseManager {
    
    public func userExists(with userId: String, completion: @escaping ((Bool) -> Void)) {
        database.child("users").child(userId).observeSingleEvent(of: .value, with: {snapshot in
            guard snapshot.value as? String != nil else {
                completion(false)
                return
                
            }
            
            completion(true)
        })
    }
    
    public func insertUser(with user: UserModel) {
        database.child("users").child(user.id).setValue(["firstName": user.firstName, "lastName": user.lastname, "email": user.email])
    }
}
