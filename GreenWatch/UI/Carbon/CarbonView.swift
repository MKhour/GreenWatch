//
//  CarbonView.swift
//  GreenWatch
//
//  Created by Madelyn Khoury on 7/19/22.
//  Copyright 2022 Madelyn Khoury.

import SwiftUI

struct CarbonView: View {
    var body: some View {
        ImageScrollBarView(
                title: "CARBON",
                titleType: .tabTitle,
                imageURL: "cropped carbon photo"
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

struct CarbonView_Previews: PreviewProvider {
    static var previews: some View {
        CarbonView()
    }
}
