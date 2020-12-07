//
//  RegisterView.swift
//  Capstone
//
//  Created by Ronald Joubert on 12/6/20.
//

import SwiftUI
import FirebaseAuth

struct RegisterView: View {
    
    @Binding var showRegister: Bool
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var firstName: String = ""
    @State private var lastName: String = ""
    
    var body: some View {
        
        VStack {
            Image(systemName: "message")
                .font(.system(size: 75, weight: .bold))
                .foregroundColor(Color(.systemGreen))
            
            Spacer()
            
            TextField("First Name", text: $firstName)
                .padding(20)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            TextField("Last Name", text: $lastName)
                .padding(20)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            TextField("Email", text: $email)
                .padding(20)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            TextField("Password", text: $password)
                .padding(20)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            Spacer()
            
            Button(action: {
                let newUser: UserModel = UserModel(firstName: firstName, lastname: lastName, email: email)
                
                DatabaseManager.shared.userExists(with: newUser.id, completion: { exists in
                    guard !exists else {
                        print("User exists")
                        return
                    }
                })
                
                FirebaseAuth.Auth.auth().createUser(withEmail: email, password: password, completion: { authResult, error  in
                        guard authResult != nil, error == nil  else {
                            return
                        }
                        
//                        let user = result.user
                        DatabaseManager.shared.insertUser(with: newUser)
                        
                        showRegister.toggle()
                    })
                }, label: {
                Text("REGISTER")
                    .foregroundColor(.black)
                    .font(.subheadline)
            })
            
            Spacer()
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView(showRegister: .constant(true))
    }
}
