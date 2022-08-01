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
            
            HStack {
                Spacer()
                articleInfo
                    .frame(width: 220)
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
                    // .clipped()
            @unknown default:
                Image("cropped landing photo")
                    .resizable()
                    // .scaledToFit()
                    .aspectRatio(contentMode: .fit)
                    // .clipped()
            }
        }
    }
    
    private var articleInfo: some View {
        ZStack {
            Rectangle()
                .foregroundColor(Color("Translucent light off white").opacity(0.9))
            
            VStack(alignment: .leading, spacing: 6) {
                Text(article.title)
                
                Text(article.description ?? "")
                    .truncationMode(.tail)
            }
            .foregroundColor(Color("Deep green"))
            .padding(8)
        }
    }
    
}

//struct NewsArticleComponent_Previews: PreviewProvider {
//    static var previews: some View {
//        NewsArticleComponent()
//    }
//}
