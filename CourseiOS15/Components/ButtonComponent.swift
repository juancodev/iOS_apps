//
//  ButtonComponent.swift
//  CourseiOS15
//
//  Created by Juan Montilla on 11/11/25.
//

import SwiftUI

struct ButtonComponent: View {
    let textButton:String
    
    @Binding var data:Double
    
    var body: some View {
            Button(action: {
                if (textButton == "+"){
                    if(data >= 125){
                        data = 125
                    } else {
                        data += 1
                    }
                } else {
                    if (data <= 0){
                        data = 0
                    } else {
                        data -= 1
                    }
                }
            }){
                Text(textButton)
                    .fontWeight(.light)
                    .font(
                        .system(size: 50, design: .monospaced)
                    )
            }
            .frame(width: 30, height: 30)
            .foregroundColor(.white)
            .padding(15)
            .background(.purple)
            .clipShape(Circle())
            .tracking(2)
        }
    }

