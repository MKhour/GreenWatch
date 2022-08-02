//
//  OfficeResponse.swift
//  GreenWatch
//
//  Created by Madelyn Khoury on 8/1/22.
//

import Foundation

struct OfficeResponse: Codable {
    let name: String
    let officialIndices: [Int]?
}
