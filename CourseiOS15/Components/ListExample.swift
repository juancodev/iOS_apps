//
//  ListExample.swift
//  CourseiOS15
//
//  Created by Juan Montilla on 1/6/26.
//

/*
 - Las lista se representan con el componente List.
 - Las listas pueden ser iteradas pero con un for, foreach pero debe tener un id (identifable). Con esto se evita duplicar el objeto y renderizarlo de manera innecesaria.
 - De esta manera se puede obtener un identificador desde un Foreach "id:\.name".
 - Necesitamos agregar en la "struct" de datos que sea de tipo :Identifiable.
 - iOS nos trae unos estilos predeterminados para modificar los componentes de List (listStyle).
 */

import SwiftUI

var pokemons = [
    Pokemon(name: "Pikachu"),
    Pokemon(name: "Charizard")
]

var digimons = [
    Digimon(name: "Agumon"),
    Digimon(name: "Graymon")
]

struct ListExample: View {
    var body: some View {
        //        List{
        //            ForEach(pokemons, id:\.name) { pokemon in
        //                /*@START_MENU_TOKEN@*/Text(pokemon.name)/*@END_MENU_TOKEN@*/
        //            }
        //        }
        //
        //        List(digimons){
        //            digimons in Text(digimons.name)
        //        }
        // Lista con secciones
        List {
            Section(header: Text("Pokemons")) {
                List{
                    ForEach(pokemons, id:\.name) { pokemon in
                        /*@START_MENU_TOKEN@*/Text(pokemon.name)/*@END_MENU_TOKEN@*/
                    }
                }
            }
            Section(header: Text("Digimons")) {
                List(digimons) {
                    digimons in Text(digimons.name)
                }
            }
        }.listStyle(.automatic)
    }
}

struct Pokemon {
    let name:String
}

// Esto :Identifiable optimiza el id como debería hacerlo.
// id = UUID() hace referencia a un id único puesto por el sistema.
struct Digimon: Identifiable {
    var id = UUID()
    let name:String
}

#Preview {
    ListExample()
}
