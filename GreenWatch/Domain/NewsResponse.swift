//
//  NewsResponse.swift
//  GreenWatch
//
//  Created by Madelyn Khoury on 7/31/22.
//

struct NewsResponse: Decodable {
    let status: String
    let totalResults: Int?
    let articles: [NewsArticle]?
    
    let code: String?
    let message: String?
}
