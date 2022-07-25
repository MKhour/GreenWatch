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
                Text("Test content 1")
                Text("Test content 2")
                Text("Test content 3")
                Text("Test content 4")
                Text("Test content 5")
                Text("Test content 6")
                Text("Test content 7")
                Text("Test content 8")
                Text("Test content 9")
            }
        }
    }
}

struct GovernmentView_Previews: PreviewProvider {
    static var previews: some View {
        GovernmentView()
    }
}
