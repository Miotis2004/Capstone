//
//  LoginView.swift
//  Capstone
//
//  Created by Ronald Joubert on 12/6/20.
//

import SwiftUI
import FirebaseAuth

struct LoginView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    
    @Binding var isLoggedIn: Bool
    @Binding var showRegister: Bool
    
    var body: some View {
        
        ZStack {
//            Color.red
            
            VStack {
                Image(systemName: "message")
                    .font(.system(size: 75, weight: .bold))
                    .foregroundColor(Color(.systemGreen))
                
                Spacer()
                
                TextField("Email", text: $email)
                    .padding(20)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                TextField("Password", text: $password)
                    .padding(20)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                Spacer()
                
                Button(action: {
                    FirebaseAuth.Auth.auth().signIn(withEmail: email, password: password, completion: { authResult, error in
                            guard let result = authResult, error == nil else {return}
                            
                            let user = result.user
                            print("Logged in user \(user)")
                            isLoggedIn.toggle()
                        })
                    }, label: {
                    Text("LOGIN")
                        .font(.system(size: 25))
                        .foregroundColor(.black)
                        .bold()
                })
                .padding()
                
                Button(action: {
                    showRegister.toggle()
                    }, label: {
                    Text("REGISTER")
                        .foregroundColor(.black)
                        .font(.subheadline)
                })
                
                Spacer()
            }
        }
        
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(isLoggedIn: .constant(false), showRegister: .constant(false))
    }
}

