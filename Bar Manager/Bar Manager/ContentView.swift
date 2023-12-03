//
//  ContentView.swift
//  Bar Manager
//
//  Created by Иван Петрухин on 20.07.2023.
//ß

import SwiftUI

struct Coctailtem: Identifiable, Decodable {
    let id = UUID().uuidString
    var name: String
    var imageName: String
    var ingredients: String
    var recipe: String
    
    enum CodingKeys: String, CodingKey {
        case name
        case imageName
        case ingredients
        case recipe
    }
    
    init(name: String = "", imageName: String = "", ingredients: String = "", recipe: String = "") {
        self.name = name
        self.imageName = imageName
        self.ingredients = ingredients
        self.recipe = recipe
    }
}

// for args in previews
extension Coctailtem {
    static let sampleData: [Coctailtem] =
    [
        Coctailtem(
            name: "sample name",
            imageName: "sampleImageName",
            ingredients: "sampleIngredients",
            recipe: "sampleRecipe"
        )
    ]
}

struct CoctailView: View {
    let coctail: Coctailtem
    
    var body: some View {
        VStack(spacing: 10) {
            ScrollView {
                Text(coctail.name)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                    .font(.system(size: 40))
                Image(coctail.imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 350, height: 350)
                    .clipped()
                    .cornerRadius(15)
                    .padding(.all)
                Text("INGREDIENTS: ")
                    .fontWeight(.bold)
                Text(coctail.ingredients)
                    .padding(.horizontal, 20)
                    .multilineTextAlignment(.leading)
                Text("RECIPE: ")
                    .fontWeight(.bold)
                Text(coctail.recipe)
                    .multilineTextAlignment(.leading)
                    .padding(.horizontal, 20)
            }
        }
    }
}

struct ContentView: View {
    @State var coctails_loaded:[Coctailtem] = []
    @State private var isPresentingAddCoctailView = false
    
    var body: some View {
        VStack {
            Button("Get dafault value") {
                guard let path = Bundle.main.url(forResource: "default_coctails", withExtension: "json") else {
                    return
                }
                do {
                    let data = try Data(contentsOf: path)
                    coctails_loaded = try JSONDecoder().decode([Coctailtem].self, from: data)
                } catch {
                    print(error)
                }
            }
            Spacer()
            NavigationStack {
                List(coctails_loaded) { coctail in
                    NavigationLink(
                        destination: {
                            CoctailView(coctail: coctail)
                        }, label: {
                            Text(coctail.name)
                        }
                    )
                }
                .navigationTitle("Coctails")
                .toolbar {
                    Button(action: {
                        isPresentingAddCoctailView = true
                    }) {
                        Image(systemName: "plus")
                    }
                    .accessibilityLabel("New Coctail")
                }
            }
            .sheet(isPresented: $isPresentingAddCoctailView) {
                AddCoctailView(
                    isPresentingAddCoctailView: $isPresentingAddCoctailView,
                    coctails: $coctails_loaded
                )
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
