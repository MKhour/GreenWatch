//
//  LandingView.swift
//  GreenWatch
//
//  Created by Madelyn Khoury on 7/19/22.
//  Copyright 2022 Madelyn Khoury.

import SwiftUI

struct LandingView: View {
    var body: some View {
        ImageScrollBarView(
                title: "GREEN WATCH",
                titleType: .appTitle,
                imageURL: "cropped landing photo"
        )
        {
            VStack(spacing: 80) {
                Text("Test content")
                Text("Test content")
                Text("Test content")
                Text("Test content")
                Text("Test content")
                Text("Test content")
                Text("Test content")
                Text("Test content")
                Text("Test content")
            }
        }
    }
}

struct LandingView_Previews: PreviewProvider {
    static var previews: some View {
        LandingView()
    }
}
