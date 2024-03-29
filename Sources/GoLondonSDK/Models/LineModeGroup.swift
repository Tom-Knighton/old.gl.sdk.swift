//
// LineModeGroup.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation

/// A Line mode and the identifiers of lines operating at this mode. i.e. bus and 498, 174 etc.
public struct LineModeGroup: Codable {
    
    /// The name of the mode i.e. 'tube'
    public var modeName: LineMode?
    
    /// A list of line identifiers here for this moe
    public var lineIdentifier: [String]?
    
    public init(modeName: LineMode? = nil, lineIdentifier: [String]? = nil) {
        self.modeName = modeName
        self.lineIdentifier = lineIdentifier
    }

}
