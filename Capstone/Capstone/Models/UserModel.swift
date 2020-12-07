//
//  UserModel.swift
//  Capstone
//
//  Created by Ronald Joubert on 12/7/20.
//

import SwiftUI

struct UserModel: Identifiable {
    let id = UUID().uuidString
    let firstName: String
    let lastname: String
    let email: String
}
