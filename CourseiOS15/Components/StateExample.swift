//
//  StateExample.swift
//  CourseiOS15
//
//  Created by Juan Montilla on 5/10/25.
//

import SwiftUI

struct StateExample: View {
    // Acá se crea la variable del estado
    @State var counter:Int = 0
    var body: some View {
        Button {
            counter += 1
        } label: {
            Text("Suscriptores: \(counter)")
                .frame(width: 200, height: 70)
                .font(.title)
                .foregroundStyle(.white)
                .background(.red)
                .cornerRadius(5)
        }
        
    }
}

#Preview {
    StateExample()
}
