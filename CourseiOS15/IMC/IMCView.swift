//
//  IMCView.swift
//  CourseiOS15
//
//  Created by Juan Montilla on 8/10/25.
//

import SwiftUI

struct IMCView: View {
    
//    init(){
//        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.white]
//    }
    
    var body: some View {
        VStack{
            
        }
        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: .infinity)
        .background(.backgoundApp)
        .toolbar{
            ToolbarItem(placement: .principal) {
                Text("IMC Calculator")
                    .foregroundStyle(.white)
                    .font(.title.bold())
            }
        }
        
        //.navigationBarBackButtonHidden()
        //.navigationTitle("IMC Calculator")
    }
}

#Preview {
    IMCView()
}
