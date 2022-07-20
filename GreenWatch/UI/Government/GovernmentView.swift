//
//  GovernmentView.swift
//  GreenWatch
//
//  Created by Madelyn Khoury on 7/19/22.
//  Copyright 2022 Madelyn Khoury.

import SwiftUI

struct GovernmentView: View {
    var body: some View {
        ScrollView {
            ImageHeaderComponent(title: "Government".uppercased(), titleType: .tabTitle, imagePath: "cropped government photo")
            Spacer()
        }
        .background(Color.white)
        .ignoresSafeArea()
    }
}

struct GovernmentView_Previews: PreviewProvider {
    static var previews: some View {
        GovernmentView()
    }
}
