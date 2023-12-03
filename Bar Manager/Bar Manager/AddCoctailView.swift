//
//  AddCoctailView.swift
//  Bar Manager
//
//  Created by Иван Петрухин on 03.12.2023.
//

import Foundation
import SwiftUI

struct AddCoctailView: View {
    @Binding var isPresentingAddCoctailView: Bool
    @Binding var coctails: [CoctailItem]
    @State var newCoctail = CoctailItem()
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Name", text: $newCoctail.name)
                    TextField("ImageName", text: $newCoctail.imageName)
                    TextField("Ingredients", text: $newCoctail.ingredients)
                        .frame(height: 50)
                    TextField("Recipe", text: $newCoctail.recipe)
                        .frame(height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
                } header: {
                    Text("Coctail info")
                }
            }
            .navigationTitle("NEW COCTAIL")
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Dismiss") {
                        isPresentingAddCoctailView = false
                    }
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button("Add") {
                        coctails.append(newCoctail)
                        isPresentingAddCoctailView = false
                    }
                }
            }
        }
    }
}

struct addCoctailView_Previews: PreviewProvider {
    static var previews: some View {
        AddCoctailView(isPresentingAddCoctailView: .constant(true),
                       coctails: .constant(CoctailItem.sampleArrayData))
    }
}
