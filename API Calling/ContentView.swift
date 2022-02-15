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
        NavigationView{
            List(elements) { element in
                NavigationLink(
                    destination: VStack {
                        Text(element.atomicMass)
                            .padding()
                        Text(element.atomicNumber)
                            .padding()
                        Text(element.meltingPoint)
                            .padding()
                        Text(element.boilingPoint)
                            .padding()
                        Text(element.symbol)
                            .padding()
                        Text(element.groupBlock)
                            padding()
                    },
                    label: {
                        Text(element.name)
                    })
            }
            .navigationTitle("Periodic Table")
        }
        .onAppear(perform: {
            getElements()
        })
    }
    func getElements {
        let apiKey = "?rapidapi-key=6b5fc628d7mshf421193b1155fbep1e47f7jsn167190dfb2bc"
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Element: Identifiable {
    let id = UUID()
    var name: String
    var atomicMass: String
    var atomicNumber: String
    var meltingPoint: String
    var boilingPoint: String
    var symbol: String
    var groupBlock: String
}

