//
//  OfficialsResponse.swift
//  GreenWatch
//
//  Created by Madelyn Khoury on 8/1/22.
//

struct OfficialsResponse: Decodable {
    
    let offices: [OfficeResponse]?
    let officials: [OfficialResponse]?
}
