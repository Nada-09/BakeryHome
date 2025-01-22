//
//  ContentView.swift
//  BakeryHome
//
//  Created by Nada Abdullah on 19/07/1446 AH.
//

import SwiftUI

struct ContentView: View {
    @State private var searchTerm = ""
    var body: some View {
        NavigationView{
            HStack {
                            Text("Welcome to Home Bakery")
                                .font(.title)
                                .padding()
                        }
            .frame(width: 430, height: 82)
            
             
            .navigationTitle("Home Bakery")
            .navigationBarTitleDisplayMode(.inline)
            .searchable(text: $searchTerm, prompt: "Search")
            .scrollContentBackground(.hidden)
            .background(Color("BG"))
            .edgesIgnoringSafeArea(.all)
        }
    }
}

#Preview {
    ContentView()
}
