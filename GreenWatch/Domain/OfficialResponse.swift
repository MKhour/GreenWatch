//
//  OfficialResponse.swift
//  GreenWatch
//
//  Created by Madelyn Khoury on 8/1/22.
//

struct OfficialResponse: Codable {
    let name: String
    let party: String
    let phones: [String]?
    let urls: [String]?
    let photoUrl: String?
    let emails: [String]?
    
}
