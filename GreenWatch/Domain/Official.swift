//
//  Official.swift
//  GreenWatch
//
//  Created by Madelyn Khoury on 8/1/22.
//

import Foundation

struct Official {
    let name: String
    let party: String
    let office: String
    let phones: [String]?
    let urls: [String]?
    let photoUrl: String?
    let emails: [String]?
    
    var partyAbbreviation: String {
        "\(party.prefix(1))"
    }
}

extension Official {
    init(from response: OfficialResponse, _ office: OfficeResponse) {
        self.name = response.name
        self.party = response.party
        self.office = office.name
        self.phones = response.phones
        self.urls = response.urls
        self.photoUrl = response.photoUrl
        self.emails = response.emails
    }
}
