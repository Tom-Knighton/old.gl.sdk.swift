//
//  File.swift
//  
//
//  Created by Tom Knighton on 04/06/2022.
//

import Foundation

/// The accessibilty levels of this Stop Point and any relevant lines
public struct StopPointAccessibility: Codable {
    
    /// The friendly name of the station
    public let stationName: String?
    
    /// An overview of how accessible the station is to all lines
    public let overviewAccessibility: StationAccessibilityType?
    
    /// Each accessible line's accessibility:
    /// This will not include lines that are not step-free at all (train or platform)
    public let lineAccessibility: [StopPointLineAccessibility]?
}

/// The data/accessibility for a specifc line at a Stop Point
public struct StopPointLineAccessibility: Codable {
    
    /// The line name i.e. Central
    public let lineName: String?
    
    /// The direction of the line i.e. Eastbound
    public let lineDirection: String?
    
    /// The level of accessibility for this line/direction
    public let accessibility: StationAccessibilityType?
}

/// The level of accessibility according to TfL, i.e. step free to train, to platform, partial (some) platforms, or interchanges only
public enum StationAccessibilityType: String, Codable, CaseIterable {
    
    case StepFreeToTrain = "StepFreeToTrain"
    case StepFreeToPlatform = "StepFreeToPlatform"
    case PartialToPlatform = "Partial"
    case InterchangeOnly = "Interchange"
    case None = "None"
}
