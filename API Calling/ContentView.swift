//
//  ContentView.swift
//  API Calling
//
//  Created by Ryan Lim on 2/15/22.
//

import SwiftUI

struct ContentView: View {
    @State private var elements = [Element]()
    @State private var showingAlert = false
    var body: some View {
        NavigationView{
            List(elements) { element in
                NavigationLink(
                    destination: VStack {
                        Text(element.atomicMass)
                            .padding()
                        Text(element.atomicNumber)
                            .padding()
                        Text(element.symbol)
                            .padding()
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
        .alert(isPresented: $showingAlert, content: {
            Alert(title: Text("Loading Error"),
                  message: Text("There was a problem loading the data"),
                  dismissButton: .default(Text("OK")))
        })
    }
    func getElements() {
        let apiKey = "?rapidapi-key=6b5fc628d7mshf421193b1155fbep1e47f7jsn167190dfb2bc"
        let query = "https://periodictable.p.rapidapi.com/\(apiKey)"
        if let url = URL(string: query) {
            if let data = try? Data(contentsOf: url) {
                let json = try! JSON(data: data)
                    let contents = json.arrayValue
                    for item in contents {
                        let name = item["name"].stringValue
                        let atomicMass = item["atomicMass"].stringValue
                        let atomicNumber = item["atomicNumber"].stringValue
                        let symbol = item["symbol"].stringValue
                        let element = Element(name: name, atomicMass: atomicMass, atomicNumber: atomicNumber, symbol: symbol)
                        elements.append(element)
                    }
                    return
                }
            }
        showingAlert = true
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
    var symbol: String
}

