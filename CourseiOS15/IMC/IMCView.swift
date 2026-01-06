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
    
    // El State funciona como una caña de pescar.
    // El $ sirve para indentificar que es un State y un Binding. Eso sirve para cambiar los valores. El dolar ($) representa que vamos a estar modificando el valor.
    @State var genderState:Int = 0
    @State var height:Double = 150
    @State var age:Double = 10
    @State var weight:Double = 50
    var body: some View {
        VStack{
            
            // Gender Section
            
            HStack{
                ToggleButton(text:"Male", imageName: "male", gender: 0, selectedGender: $genderState).cornerRadius(15)
                ToggleButton(text:"Female", imageName: "female", gender: 1, selectedGender: $genderState).cornerRadius(15)
            }
            
            // Height Section
            
            HeightCalculator(selectedHeight: $height )
            
            //  Age and weight Section
            HStack {
                VStack{
                            InformationText(text: "Edad", subTitle: true)
                            InformationText(text: "\(Int(age))", subTitle: false)
                    HStack (spacing: 20) {
                        ButtonComponent(textButton: "-", data: $age)
                        ButtonComponent(textButton: "+", data: $age)
                    }
                }.frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(.backgroundComponent)
                    .cornerRadius(15)
                VStack{
                        InformationText(text: "Peso", subTitle: true)
                        InformationText(text: "\(Int(weight))", subTitle: false)
                    HStack (spacing: 20) {
                        ButtonComponent(textButton: "-", data: $weight)
                        ButtonComponent(textButton: "+", data: $weight)
                    }
                }.frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(.backgroundComponent)
                    .cornerRadius(15)
            }.frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: .infinity)
            
            // Button Calculate Section
            
            IMCCalculateButton(userWeight: Double(weight), userHeight: Double(height))
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding(.vertical, 10)
        .padding(.horizontal, 7)
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

// Si llego a presentar problema visual en la preview, solamente debo ejecutar desde el emulador y listo.

struct IMCCalculateButton:View {
    let userWeight:Double
    let userHeight:Double
    var body: some View {
        NavigationStack {
            NavigationLink(destination:{ IMCResult(userWeight: userWeight, userHeight: userHeight) }){
                Text("Calcular")
                    .font(.title)
                    .bold()
                    .foregroundStyle(.white)
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: 85)
                    .background(.backgroundComponent)
                    .cornerRadius(15)
            }
        }
    }
}

struct ToggleButton:View {
    let text:String
    let imageName:String
    let gender:Int
    
    // El binding es el que nos permite comunicarnos con el hijo directo para recibir el valor y compartir estados y modificaciones.
    // Es como la hilo y el anzuelo
    @Binding var selectedGender:Int
    
    
    var body: some View {
        
        let color = if (gender == selectedGender){
            Color.backgroundComponentSelected
        } else {
            Color.backgroundComponent
        }
        
        Button(action: {
            selectedGender = gender
            print(selectedGender)
        }){
            VStack {
                Image(imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
                    .foregroundColor(.white)
                InformationText(text: text, subTitle: false)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(color)
        }
    }
}

struct InformationText:View {
    let text:String
    let subTitle:Bool
    var body: some View {
        let titleVariable = if (subTitle){
            Text(text)
                .font(.title2)
                .foregroundStyle(.gray)
        } else {
            Text(text)
                .font(.largeTitle)
                .bold()
                .foregroundStyle(.white)
        }
        return titleVariable
    }
}

struct HeightCalculator:View {
    // Slider recibe 3 argumentos como mínimo.
    /*
     1.- value: El valor que va a recibir como Binding.
     2.- in: Rango que se mide desde dónde va a comenzar hasta dónde va a terminar.
     3.- step: Los pasos o veces que va a moverse, es decir, de 1 en 1 o 2 en 2.
     
     El Binding debe ser un Double porque ellos trabajan con ese valor.
     */
    
    @Binding var selectedHeight:Double
    
    var body: some View {
        VStack {
            InformationText(text: "Altura", subTitle: true)
            InformationText(text: "\(Int(selectedHeight)) cm", subTitle: false)
            Slider(value: $selectedHeight, in: 100...220, step: 1)
                .tint(.white)
                .padding(.horizontal, 20)
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.backgroundComponent)
        .cornerRadius(10)
    }
}

#Preview {
    IMCView()
}
