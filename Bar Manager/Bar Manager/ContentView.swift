//
//  ContentView.swift
//  Bar Manager
//
//  Created by Иван Петрухин on 20.07.2023.
//ß

import SwiftUI

struct ContentView: View {
    
    @State var coctails_loaded:[CoctailItem] = []
    @State private var isPresentingAddCoctailView = false
    
    var body: some View {
        VStack {
            Button("Get dafault value") {
                guard let path = Bundle.main.url(forResource: "default_coctails", withExtension: "json") else {
                    return
                }
                do {
                    let data = try Data(contentsOf: path)
                    coctails_loaded = try JSONDecoder().decode([CoctailItem].self, from: data)
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
