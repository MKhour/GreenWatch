//
//  LandingView.swift
//  GreenWatch
//
//  Created by Madelyn Khoury on 7/19/22.
//  Copyright 2022 Madelyn Khoury.

import SwiftUI
import WebKit

struct LandingView: View {
    @StateObject private var viewModel = LandingViewModel()
    
    var body: some View {
        ImageScrollBarView(
            title: "GREEN WATCH",
            titleType: .appTitle,
            imageURL: "cropped landing photo"
        )
        {
            VStack(spacing: 20) {
                Text(
                    """
                    Thanks for joining us in our journey to protect the environment.
                    Your voice matters!
                    """
                )
                .font(Constants.subtitleFont)
                .multilineTextAlignment(.center)
                .lineSpacing(4)
                
                Text("NEWS")
                    .font(Constants.headingFont)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                ForEach(viewModel.articles ?? [], id: \.url) { article in
                    Link(destination: article.articleURL) {
                        NewsArticleComponent(article: article)
                    }
                }
                
            }
            .padding(.horizontal, 20)
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
