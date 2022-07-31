//
//  NewsDataSource.swift
//  GreenWatch
//
//  Created by Madelyn Khoury on 7/16/22.
//
// This file draws on https://github.com/alfianlosari/NewsAppSwiftUI/blob/main/1%20Build%20an%20iOS%20News%20App%20with%20SwiftUI%203%20%26%20NewsAPI/XCANews/XCANews/API/NewsAPI.swift


import Foundation

struct NewsDataSource {
    
    static let shared = NewsDataSource()
    private let apiKey = "apiKey"
    private let session = URLSession.shared
    
    func fetchArticles(for keyword: String) async throws -> [NewsArticle] {
        let request = createURL(from: keyword)
        
        let (data, response) = try await URLSession.shared.data(from: request)
        
        guard let response = response as? HTTPURLResponse else {
            throw NSError()
        }
        
        switch response.statusCode {
        case 200:
            let newsResponse = try JSONDecoder().decode(NewsResponse.self, from: data)
            return newsResponse.articles ?? []
        default:
            throw NSError()
        }
    }
    
    private func createURL(from query: String) -> URL {
        let percentEncodedString = query.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? query
        var url = "https://newsapi.org/v2/everything?"
        url += "apiKey=\(apiKey)"
        url += "&language=en"
        url += "&q=\(percentEncodedString)"
        return URL(string: url)!
    }

}
