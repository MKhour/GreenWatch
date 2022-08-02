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
    
    func fetchOfficials(for address: String) async throws -> [Official] {
        let request = createURL(for: address)
        
        let (data, response) = try await URLSession.shared.data(from: request)
        
        guard let response = response as? HTTPURLResponse else {
            throw NSError()
        }
        
        switch response.statusCode {
        case 200:
            let officialsResponse = try JSONDecoder().decode(OfficialsResponse.self, from: data)
            var officials: [Official] = []
            
            for office in officialsResponse.offices ?? [] {
                for index in office.officialIndices ?? [] {
                    guard let officialResponse = officialsResponse.officials?[index] else { break }
                    officials.append(contentsOf: [Official(from: officialResponse, office)])
                }
            }
            return officials
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
