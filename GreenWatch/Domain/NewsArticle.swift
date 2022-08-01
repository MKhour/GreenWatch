//
//  NewsArticle.swift
//  GreenWatch
//
//  Created by Madelyn Khoury on 7/31/22.
//  Copyright Madelyn Khoury 2022.

import Foundation

struct NewsArticle: Codable {
    let author: String?
    let title: String
    let description: String?
    let url: String
    let urlToImage: String?
    let publishedAt: String?
    
    var articleURL: URL {
        URL(string: url)!
    }
    
    var imageURL: URL? {
        if let urlToImage = urlToImage {
            return URL(string: urlToImage)
        }
        return nil
    }
}
