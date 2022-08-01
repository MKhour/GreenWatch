//
//  NewsArticleComponent.swift
//  GreenWatch
//
//  Created by Madelyn Khoury on 7/31/22.
//

import SwiftUI

struct NewsArticleComponent: View {
    private var article: NewsArticle
    
    init(article: NewsArticle) {
        self.article = article
    }
    
    var body: some View {
        ZStack {
            image
            .overlay {
                HStack {
                    Spacer()
                    articleInfo
                        .frame(width: 220)
                }
            }
            
        }
        .clipShape(RoundedRectangle(cornerRadius: 12))
        
    }
    
    private var image: some View {
        AsyncImage(url: article.imageURL) { imagePhase in
            switch imagePhase {
            case .success(let image):
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .clipped()
            @unknown default:
                Image("cropped news photo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .clipped()
            }
        }
    }
    
    private var articleInfo: some View {
        ZStack {
            Rectangle()
                .foregroundColor(Color("Translucent light off white"))
            
            VStack(alignment: .leading, spacing: 6) {
                Text(article.title)
                    .font(Constants.articleTitle)
                
                Text(article.description ?? "")
                    .font(Constants.articleDescriptionFont)
                    .truncationMode(.tail)
            }
            .foregroundColor(Color("Deep green"))
            .multilineTextAlignment(.leading)
            .lineSpacing(4)
            .padding(12)
        }
    }
    
}
