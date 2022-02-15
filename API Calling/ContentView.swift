//
//  ContentView.swift
//  API Calling
//
//  Created by Ryan Lim on 2/15/22.
//

import SwiftUI

struct ContentView: View {
    @State private var elements = [Element]()
    var body: some View {
        Text("Hello, world!")
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Element: Identifiable {
    let id = UUID()
    var atomicMass: String
    var atomicNumber: String
    var meltingPoint: String
    var boilingPoint: String
    var symbol: String
    var groupBlock: String
}
