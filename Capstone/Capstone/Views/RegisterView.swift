//
//  RegisterView.swift
//  Capstone
//
//  Created by Ronald Joubert on 12/6/20.
//

import SwiftUI

struct RegisterView: View {
    
    @Binding var showRegister: Bool
    
    var body: some View {
        Button(action: {
            showRegister.toggle()
            }, label: {
            Text("REGISTER")
                .foregroundColor(.black)
                .font(.subheadline)
        })
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView(showRegister: .constant(true))
    }
}
