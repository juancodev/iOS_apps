//
//  IMCResult.swift
//  CourseiOS15
//
//  Created by Juan Montilla on 12/13/25.
//

import SwiftUI

struct IMCResult: View {
    let userWeight:Double
    let userHeight:Double
    var body: some View {
        VStack {
            Text("Tu Resultado").font(.title).bold().foregroundStyle(.white)
            let calculatedResult = calculateImc(weight: userWeight, height: userHeight)
            InformationView(result: calculatedResult)
        }.frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: .infinity).background(.backgoundApp)
    }
}

// Esta es una función para calcular el IMC
func calculateImc(weight:Double, height:Double) -> Double{
    let result = weight/((height/100)*(height/100))
    return result
}

// Acá se mostrará la vista del resultado

/*
 - Spacer(): Me sirve como un gap para dar espacio entre los componentes.
 - .clipShape(AnyShape(.rect(cornerRadius: 16))): Funciona para reemplazar el "cornerRadius" que está en desuso.
 */
struct InformationView:View {
    let result:Double
    var body: some View {
        
        let information = getIMCResult(result: result)
        
        VStack {
            Spacer()
            Text(information.0).foregroundStyle(.green).font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/).bold()
            // specifier, me permite con el String "%.2f" me deja agregar 2 decimales.
            Spacer()
            Text("\(result, specifier: "%.2f")").font(.system(size: 80)).bold().foregroundStyle(.white)
            Spacer()
            Text(information.1).foregroundStyle(.white).font(.title2).multilineTextAlignment(.center).padding(.horizontal, 8)
            Spacer()
        }.frame(maxWidth: .infinity, maxHeight: .infinity).background(.backgroundComponent).clipShape(AnyShape(.rect(cornerRadius: 16))).padding(16)
    }
}

func getIMCResult(result:Double) -> (String, String, Color){
    let title:String
    let description:String
    let color:Color
    
    switch result {
        // case 0.00..<20 es otra forma de hacer el rango desde uno hasta lo que esté por debajo del otro
    case 0.00...19.99:
        title = "Peso bajo"
        description = "Estás por debajo del peso recomendado según el IMC."
        color = Color.yellow
    case 20.00...24.99:
        title = "Peso Normal"
        description = "Estás en el peso recomendado según el IMC."
        color = Color.green
    case 25.00...29.99:
        title = "Sobrepeso"
        description = "Estás por encima del peso recomendado según el IMC."
        color = Color.orange
    case 30...100:
        title = "Obesidad"
        description = "Estás muy por encima del peso recomendado según el IMC."
        color = Color.red
    default:
        title = "ERROR"
        description = "Ha ocurrido un error"
        color = Color.gray
    }
    
    return (title, description, color)
}

#Preview {
    IMCResult(userWeight: 50, userHeight: 160)
}
