//
//  GovernmentView.swift
//  GreenWatch
//
//  Created by Madelyn Khoury on 7/19/22.
//  Copyright 2022 Madelyn Khoury.

import SwiftUI

struct GovernmentView: View {
    var body: some View {
        ImageScrollBarView(
                title: "GOVERNMENT",
                titleType: .tabTitle,
                imageURL: "cropped government photo"
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

struct GovernmentView_Previews: PreviewProvider {
    static var previews: some View {
        GovernmentView()
    }
}
