//
//  OfficialsDataSource.swift
//  GreenWatch
//
//  Created by Madelyn Khoury on 7/31/22.
//

import Foundation

struct OfficialsDataSource {
    
    static let shared = OfficialsDataSource()
    private let apiKey = "apiKey"
    private let session = URLSession.shared
    
    func fetchOfficials(for address: String) async throws -> [NewsArticle] {
        let request = createURL(for: address)
        
        let (data, response) = try await URLSession.shared.data(from: request)
        
        guard let response = response as? HTTPURLResponse else {
            throw NSError()
        }
        
        print("RESPONSE: \(response)")
        
        switch response.statusCode {
        case 200:
           // let newsResponse = try JSONDecoder().decode(NewsResponse.self, from: data)
           // return newsResponse.articles ?? []
            return []
        default:
            throw NSError()
        }
    }
    
    private func createURL(for address: String) -> URL {
        // var percentEncodedString = address.trimmingCharacters(in: .whitespacesAndNewlines)
        let percentEncodedString = address.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? address
        var url = "https://civicinfo.googleapis.com/civicinfo/v2/representatives?"
        url += "address=\(percentEncodedString)"
        url += "&key=\(apiKey)"
        return URL(string: url)!
    }

}
