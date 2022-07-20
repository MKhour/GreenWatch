//
//  LandingView.swift
//  GreenWatch
//
//  Created by Madelyn Khoury on 7/19/22.
//  Copyright 2022 Madelyn Khoury.

import SwiftUI

struct LandingView: View {
    var body: some View {
        ScrollView {
            ImageHeaderComponent(title: "Green Watch".uppercased(), titleType: .appTitle, imagePath: "cropped landing photo")
            Spacer()
        }
        .background(Color.white)
        .ignoresSafeArea()
    }
}

struct LandingView_Previews: PreviewProvider {
    static var previews: some View {
        LandingView()
    }
}
