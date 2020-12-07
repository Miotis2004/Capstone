//
//  CapstoneApp.swift
//  Capstone
//
//  Created by Ronald Joubert on 12/6/20.
//

import SwiftUI
import Firebase

@main
struct CapstoneApp: App {
    
    @State private var isLoggedIn: Bool = false
    @State private var showRegister: Bool = false
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            if isLoggedIn {
                ContentView()
            } else if !showRegister {
                LoginView(isLoggedIn: $isLoggedIn, showRegister: $showRegister)
            } else {
                RegisterView(showRegister: $showRegister)
            }
            
        }
    }
}


