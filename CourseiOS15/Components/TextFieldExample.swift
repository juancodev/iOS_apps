//
//  TextFieldExample.swift
//  CourseiOS15
//
//  Created by Juan Montilla on 5/10/25.
//

import SwiftUI

struct TextFieldExample: View {
    @State var email:String = ""
    @State var password:String = ""
    var body: some View {
        VStack {
            TextField("Escribe tu email", text: $email)
                .keyboardType(.emailAddress)
                .padding(16)
                .background(.gray.opacity(0.2))
                .cornerRadius(16)
                .padding(.horizontal, 32)
                .onChange(of: email) { oldValue, newValue in
                    print("El antiguo valor era \(oldValue) y el nuevo valor es \(newValue)")
                }
            SecureField("Escribe tu contraseña", text: $password)
                .keyboardType(.default)
                .padding(16)
                .background(.gray.opacity(0.2))
                .cornerRadius(16)
                .padding(.horizontal, 32)
                .onChange(of: password) { oldValue, newValue in
                    print("El antiguo valor era \(oldValue) y el nuevo valor es \(newValue)")
                }
        }
    }
}

#Preview {
    TextFieldExample()
}
