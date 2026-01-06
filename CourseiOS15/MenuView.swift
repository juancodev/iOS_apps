//
//  MenuView.swift
//  CourseiOS15
//
//  Created by Juan Montilla on 7/10/25.
//

import SwiftUI

struct MenuView: View {
    var body: some View {
        NavigationStack{
            List {
                NavigationLink(destination:IMCView()){
                    Text("IMC Calculator")
                }
            }
        }
    }
}

#Preview {
    MenuView()
}
