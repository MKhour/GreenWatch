//
//  File.swift
//  GreenWatch
//
//  Created by Madelyn Khoury on 7/16/22.
//

struct Response: Codable {
    var results: [Result]
}

struct Result: Codable {
    var trackId: Int
    var trackName: String
    var collectionName: String
}
