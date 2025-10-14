//
//  TextExample.swift
//  CourseiOS15
//
//  Created by Juan Montilla on 3/10/25.
//

import SwiftUI

struct TextExample: View {
    var body: some View {
        Text("Hello world!").font(.title)
        Text("Custom Text")
            .font(
                .system(
                    size: 30,
                    weight: .bold,
                    design: .monospaced
                )
            )
            .italic()
            .underline()
            .foregroundStyle(.cyan)
            .background(.gray)
        
        Text("juancodev juancodev juancodev juancodev")
            .font(.headline)
            .frame(width: 100)
            .lineLimit(3)
            .lineSpacing(20)
    }
}

#Preview {
    TextExample()
}
