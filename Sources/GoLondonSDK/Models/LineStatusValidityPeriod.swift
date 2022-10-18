//
// LineStatusValidityPeriod.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation

/// When a LineStatus is valid from and until
public struct LineStatusValidityPeriod: Codable {

    /// When the status is valid from
    public var fromDate: Date?
    
    /// When the status is valid to
    public var toDate: Date?
    
    /// For convenience, if the status is happening now
    public var isNow: Bool?
    
    public init(fromDate: Date? = nil, toDate: Date? = nil, isNow: Bool? = nil) {
        self.fromDate = fromDate
        self.toDate = toDate
        self.isNow = isNow
    }

}
