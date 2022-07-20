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
            VStack {
                LandingView()
                tabBackground
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
    }
    
    private var tabBackground: some View {
        Rectangle()
            .fill(Color.clear)
            .frame(height: 5, alignment: .bottom)
            .background(Color("Light off white"))
            // .background(Color.green.opacity(0.2))
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
