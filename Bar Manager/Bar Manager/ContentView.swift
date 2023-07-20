//
//  ContentView.swift
//  Bar Manager
//
//  Created by Иван Петрухин on 20.07.2023.
//ß

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Daiquiri")
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
            Image("daiquiri.original").resizable()
                .cornerRadius(15)
                .aspectRatio( contentMode: .fit)
                .padding(.all)
            Text("1 1/2 oz White rum, 1 oz Lime juice, 1/2 oz Simple syrup")
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
