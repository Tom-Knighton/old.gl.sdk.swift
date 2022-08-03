//
//  File.swift
//  
//
//  Created by Tom Knighton on 26/07/2022.
//

import Foundation

/// Information containing the quietest times for a StopPoint
public struct StopPointCrowding: Codable {
    
    /// Whether this information has a non-empty `dailyCrowding` dictionary
    public let containsDaily: Bool
    
    /// The general weekly quietest time according to TfL
    public let generalWeeklyCrowding: String
    
    /// The general weekend quietest time according to TfL
    public let generalWeekendCrowding: String
    
    /// The quietest time information per day, based on a short day key i.e. 'MON', 'SAT' etc.
    public let dailyCrowding: [String: String]
}
