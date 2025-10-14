//
//  LabelText.swift
//  CourseiOS15
//
//  Created by Juan Montilla on 3/10/25.
//

import SwiftUI

struct LabelExample: View {
    var body: some View {
        //Label("Hello World", image: "apple_logo")
        Label("SwiftUI", systemImage: "person")
        Label(
            title: { Text("iOS 17") },
            icon: {
                Image("apple_logo")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 20, height: 23)
            }
        )
    }
}

#Preview {
    LabelExample()
}
