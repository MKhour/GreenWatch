//
//  ContentView.swift
//  GreenWatch
//
//  Created by Madelyn Khoury on 7/16/22.
//  Copyright 2022 Madelyn Khoury.

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        TabView {
            LandingView()
                .tabItem {
                    Label("Home", systemImage: "leaf") // "globe.americas.fill"
                }
            
            GovernmentView()
                .tabItem {
                    Label("Govt", systemImage: "building.columns.fill") // "person.text.rectangle"
                    
                }
            
            CarbonView()
                .tabItem {
                    Label("Carbon", systemImage: "atom") // "circle.hexagongrid"
                    // "leaf"
                }
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
