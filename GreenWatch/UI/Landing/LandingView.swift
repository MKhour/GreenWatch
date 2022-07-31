//
//  LandingView.swift
//  GreenWatch
//
//  Created by Madelyn Khoury on 7/19/22.
//  Copyright 2022 Madelyn Khoury.

import SwiftUI

struct LandingView: View {
    @StateObject private var viewModel = LandingViewModel()
    
    var body: some View {
        ImageScrollBarView(
            title: "GREEN WATCH",
            titleType: .appTitle,
            imageURL: "cropped landing photo"
        )
        {
            VStack(alignment: .leading, spacing: 14) {
                Text(
                    """
                    Thanks for joining us in our journey to protect the environment.
                    Your voice matters!
                    """
                )
                .font(Constants.subtitleFont)
                .multilineTextAlignment(.center)
                .lineSpacing(4)
                .padding()
                
                Text("NEWS")
                    .font(Constants.headingFont)
                
                ForEach(viewModel.articles ?? [], id: \.title) { article in
                    Text("\(article.title)")
                }
                
            }
            .padding(.horizontal, 14)
            .foregroundColor(Color("Deep green"))
        }
        .onAppear {
            Task {
                await viewModel.start()
            }
        }
    }
}

struct LandingView_Previews: PreviewProvider {
    static var previews: some View {
        LandingView()
    }
}
