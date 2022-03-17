//
//  File.swift
//  
//
//  Created by Tom Knighton on 07/03/2022.
//

import Foundation

extension Encodable {
    
    func jsonEncode() -> Data? {
        let encoder = JSONEncoder()
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        formatter.timeZone = TimeZone(abbreviation: "UTC")
        encoder.dateEncodingStrategy = .formatted(formatter)
        let encoded = try? encoder.encode(self)
        return encoded
    }
}
