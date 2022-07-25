//
//  ContentView.swift
//  GreenWatch
//
//  Created by Madelyn Khoury on 7/16/22.
//  Copyright 2022 Madelyn Khoury.

import SwiftUI

struct ContentView: View {
    
    init() {
        UITabBar.appearance().backgroundColor = UIColor(Color.white.opacity(0.5))
        UITabBar.appearance().unselectedItemTintColor = UIColor(Color("Deeper offwhite"))
        // UITabBar.appearance().selectedItem = UIColor(Color("Deep green"))
    }
    
    var body: some View {
        TabView {
            VStack {
                LandingView()
            }
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
        .accentColor(Color("Deep green"))
    }
        
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
