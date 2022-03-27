//
//  File.swift
//  
//
//  Created by Tom Knighton on 27/03/2022.
//

import Foundation

protocol ClassFamily: Decodable {
    
    static var discriminator: Discriminator { get }
    func getType() -> AnyObject.Type
}

enum Discriminator: String, CodingKey {

    case PointDiscriminator = "pointType"
}

class ClassWrapper<T: ClassFamily, U: Decodable>: Decodable {
    let family: T
    let object: U?
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: Discriminator.self)
        family = try container.decode(T.self, forKey: T.discriminator)
        if let type = family.getType() as? U.Type {
            object = try type.init(from: decoder)
        } else {
            object = nil
        }
    }
}
