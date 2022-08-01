//
//  GovernmentView.swift
//  GreenWatch
//
//  Created by Madelyn Khoury on 7/19/22.
//  Copyright 2022 Madelyn Khoury.

import SwiftUI

struct GovernmentView: View {
    @StateObject private var viewModel = GovernmentViewModel()
    
    var body: some View {
        ImageScrollBarView(
                title: "GOVERNMENT",
                titleType: .tabTitle,
                imageURL: "cropped government photo"
        )
        {
            VStack(alignment: .leading, spacing: 20) {
                Text(
                    """
                    Keep your government officials accountable; \
                    let them know that you support climate regulations!
                    """
                )
                .font(Constants.subtitleFont)
                .multilineTextAlignment(.leading)
                .lineSpacing(4)
                
                Text("News from Your Officials")
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

struct GovernmentView_Previews: PreviewProvider {
    static var previews: some View {
        GovernmentView()
    }
}
