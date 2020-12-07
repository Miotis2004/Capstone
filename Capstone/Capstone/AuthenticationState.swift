//
//  AuthenticationState.swift
//  Capstone
//
//  Created by Ronald Joubert on 12/6/20.
//

import SwiftUI
import Firebase

class AuthenticationState: NSObject, ObservableObject {
    @Published var loggedInUser: User?
    @Published var isAuthenticating: Bool = false
    @Published var error: NSError?
    
    static let shared = AuthenticationState()
    
    private let auth = Auth.auth()
    fileprivate var currentNonce: String?
    
    func login(with loginOption: LoginOption) {
        self.isAuthenticating = true
        self.error = nil
        
        switch loginOption {
        case .signinWithApple:
            handleSignInWithApple()
        case let .emailAndPassword(email, password):
            handleSignInWith(email: email, password: password)
        }
    }
    
    func signup(email: String, password: String, passwordConfirmation: String) {
        
    }
    
    func handleSignInWith(email: String, password: String) {
        
    }
    
    func handleSignInWithApple() {
        
    }
}


enum LoginOption {
    case signinWithApple
    case emailAndPassword
    
}
