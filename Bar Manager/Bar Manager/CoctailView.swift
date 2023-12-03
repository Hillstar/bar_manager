//
//  CoctailView.swift
//  Bar Manager
//
//  Created by Иван Петрухин on 03.12.2023.
//

import Foundation
import SwiftUI

struct CoctailView: View {
    let coctail: CoctailItem
    
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

struct CoctailView_Previews: PreviewProvider {
    static var previews: some View {
        CoctailView(coctail: CoctailItem.sampleData)
    }
}
