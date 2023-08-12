//
//  ContentView.swift
//  Bar Manager
//
//  Created by Иван Петрухин on 20.07.2023.
//ß

import SwiftUI

struct Coctailtem: Identifiable {
    let id = UUID()
    let name: String
    let imageName: String
    let ingredients: String
    let recipe: String
}

struct CoctailView: View {
    let coctail: Coctailtem
    
    var body: some View {
        VStack {
            Text(coctail.name)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
            Image(coctail.imageName).resizable()
                .cornerRadius(15)
                .aspectRatio( contentMode: .fit)
                .padding(.all)
            Text(coctail.ingredients)
            Text(coctail.recipe)
        }
    }
}

struct ContentView: View {
    let coctails = [
        Coctailtem(
            name: "Daiquiri",
            imageName: "daiquiri.original",
            ingredients: "1 1/2 oz White rum, 1 oz Lime juice, 1/2 oz Simple syrup",
            recipe: "Shake all ingredients in a shaker"
            ),
        Coctailtem(
            name: "Old fashioned",
            imageName: "old_fashioned.original",
            ingredients: "1 1/2 oz Bourbon or Rye whiskey, 1 Sugar cube, 2 dashes Angostura bitters, Few dashes plain water",
            recipe: "Place sugar cube in old fashioned glass and saturate with bitters, add a dash of plain water. Muddle until dissolved. Fill the glass with ice cubes and add whiskey. Garnish with orange slice, and a cocktail cherry"
            ),
        Coctailtem(
            name: "Aperol Spritz",
            imageName: "aperol_spritz.original",
            ingredients: "1 1/4 oz Aperol, 2 oz Prosecco, Splash of Soda water",
            recipe: "Build into glass over ice, garnish and serve"
            ),
    ]
    var body: some View {
        NavigationView {
            List(coctails) { coctail in
                NavigationLink( destination: {
                    CoctailView(coctail: coctail)
                }, label: {
                    Text(coctail.name)
                }
                )
                .navigationTitle("Coctails")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
