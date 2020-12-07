//
//  LoginView.swift
//  Capstone
//
//  Created by Ronald Joubert on 12/6/20.
//

import SwiftUI

struct LoginView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    
    @Binding var isLoggedIn: Bool
    @Binding var showRegister: Bool
    
    var body: some View {
        
        ZStack {
//            Color.red
            
            VStack {
                Text("LOGIN")
                    .font(.title)
                    .bold()
                
                Spacer()
                
                TextField("Email", text: $email)
                    .padding(20)
                
                TextField("Password", text: $password)
                    .padding(20)
                
                Spacer()
                
                Button(action: {
                    isLoggedIn.toggle()
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
