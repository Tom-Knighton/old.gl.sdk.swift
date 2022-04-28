//
//  POIPoint.swift
//  
//
//  Created by Tom Knighton on 27/03/2022.
//

import Foundation

/// A place of interest in the world, or an address
public class POIPoint: Point {
    
    /// The unique id of the POI point
    public var id: String?
    
    /// The text of the POI point i.e. 'O2'
    public var text: String?
    
    /// Usually the address of the POI point i.e. 'O2, The O2 Millenium Way, London, England SE10 0DY, United Kingdom'
    public var place_name: String?
    
    public required init(from decoder: Decoder) throws {
        self.id = try decoder.container(keyedBy: CodingKeys.self).decode(String?.self, forKey: .id)
        self.text = try decoder.container(keyedBy: CodingKeys.self).decode(String?.self, forKey: .text)
        self.place_name = try decoder.container(keyedBy: CodingKeys.self).decode(String?.self, forKey: .place_name)
        
        try super.init(from: decoder)
    }
    
    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.text, forKey: .text)
        try container.encode(self.place_name, forKey: .place_name)
    }
    
    enum CodingKeys: String, CodingKey {
        case id, text, place_name
    }
}
