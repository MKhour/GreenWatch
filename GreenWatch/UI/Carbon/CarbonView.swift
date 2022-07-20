//
//  CarbonView.swift
//  GreenWatch
//
//  Created by Madelyn Khoury on 7/19/22.
//  Copyright 2022 Madelyn Khoury.

import SwiftUI

struct CarbonView: View {
    var body: some View {
        ScrollView {
            ImageHeaderComponent(title: "Carbon".uppercased(), titleType: .tabTitle, imagePath: "cropped carbon photo")
            Spacer()
        }
        .background(Color.white)
        .ignoresSafeArea()
    }
}

struct CarbonView_Previews: PreviewProvider {
    static var previews: some View {
        CarbonView()
    }
}
