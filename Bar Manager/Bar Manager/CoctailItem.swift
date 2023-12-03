//
//  CoctailItem.swift
//  Bar Manager
//
//  Created by Иван Петрухин on 03.12.2023.
//

import Foundation

struct CoctailItem: Identifiable, Decodable {
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
    
    init(name: String = "", imageName: String = "sampleImage", ingredients: String = "", recipe: String = "") {
        self.name = name
        self.imageName = imageName
        self.ingredients = ingredients
        self.recipe = recipe
    }
}

// for args in previews
extension CoctailItem {
    static let sampleArrayData: [CoctailItem] =
    [
        CoctailItem(
            name: "sampleName_1",
            imageName: "sampleImage",
            ingredients: "sampleIngredients_1",
            recipe: "sampleRecipe_1"
        ),
        CoctailItem(
            name: "sampleName_2",
            imageName: "sampleImage",
            ingredients: "sampleIngredients_2",
            recipe: "sampleRecipe_2"
        )
    ]
    static let sampleData = CoctailItem(
        name: "sampleName",
        imageName: "sampleImage",
        ingredients: "sampleIngredients",
        recipe: "sampleRecipe"
    )
}
