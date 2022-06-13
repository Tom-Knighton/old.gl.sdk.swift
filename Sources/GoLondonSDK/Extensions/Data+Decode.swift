//
//  Data+Decode.swift
//  
//
//  Created by Tom Knighton on 07/03/2022.
//

import Foundation

extension Data {
    func decode<BodyType: Decodable>(to type: BodyType.Type) throws -> BodyType? {
        let decoder = JSONDecoder()
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        formatter.timeZone = TimeZone(abbreviation: "UTC")
        decoder.dateDecodingStrategy = .custom({ (decoder) -> Date in
            let container = try decoder.singleValueContainer()
            let dateString = try container.decode(String.self)
            return formatter.date(from: dateString) ?? Date.distantPast
        })
        let decoded = try decoder.decode(BodyType.self, from: self)
        return decoded
        
    }
}
