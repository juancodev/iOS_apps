//
//  ButtonExample.swift
//  CourseiOS15
//
//  Created by Juan Montilla on 5/10/25.
//

import SwiftUI

struct ButtonExample: View {
    var body: some View {
        Button("Button") {
            print("Button click!")
        }
        
        Button(action: { print("Button click 2!") }, label: {
            /*@START_MENU_TOKEN@*/Text("Button")/*@END_MENU_TOKEN@*/
                .frame(width: 100, height: 50)
                .foregroundStyle(.black)
                .background(.cyan)
                .border(.cyan)
                .cornerRadius(5)
        })
    }
}

#Preview {
    ButtonExample()
}
