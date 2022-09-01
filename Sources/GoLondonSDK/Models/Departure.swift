//
//  Departure.swift
//  
//
//  Created by Tom Knighton on 21/08/2022.
//

import Foundation

/// Data representing a Train/Bus's departure from a StopPoint
public struct Departure: Codable {
    
    public init(platformName: String? = nil, vehicleId: String? = nil, lineId: String, destinationName: String? = nil, destinationNaptan: String? = nil, estimatedArrival: Date? = nil, estimatedDeparture: Date? = nil, scheduledArrival: Date? = nil, scheduledDeparture: Date? = nil, status: String? = nil, towards: String? = nil, tubeDirection: String? = nil, currentDirection: String? = nil) {
        self.platformName = platformName
        self.vehicleId = vehicleId
        self.lineId = lineId
        self.destinationName = destinationName
        self.destinationNaptan = destinationNaptan
        self.estimatedArrival = estimatedArrival
        self.estimatedDeparture = estimatedDeparture
        self.scheduledArrival = scheduledArrival
        self.scheduledDeparture = scheduledDeparture
        self.status = status
        self.towards = towards
        self.tubeDirection = tubeDirection
        self.currentDirection = currentDirection
    }
    
    
    /// The name of the platform this departure is arriving at
    public let platformName: String?
    
    /// The ID of the vehicle, only works for some tube lines and busses
    public let vehicleId: String?
    
    /// The ID of the line this departure is a part of
    public let lineId: String
    
    /// The friendly name of the end destination for this departure
    public let destinationName: String?
    
    /// The NaPTAN Id of the destination
    public let destinationNaptan: String?
    
    /// The estimated time of arrvail for this departure
    public let estimatedArrival: Date?
    
    /// The estimated time of departure from this station
    public let estimatedDeparture: Date?
    
    /// The originally scheduled time of arrival
    public let scheduledArrival: Date?
    
    /// The originally scheduled time of departure
    public let scheduledDeparture: Date?
    
    /// The status, if any, of this departure
    public let status: String?
    
    /// Some tube/buses have a 'towards' string i.e. if the line splits
    public let towards: String?
    
    /// For tube lines, whether this is west/eastbound
    public let tubeDirection: String?
    
    /// For some lines, the current direction of this vehicle
    public let currentDirection: String?
}

///  Data grouping some platform groups under a line id
public struct DepartureLineGroup: Codable {
    
    internal init(lineId: String, platformGroups: [DeparturePlatformGroup] = []) {
        self.lineId = lineId
        self.platformGroups = platformGroups
    }
    
    /// The LineID of the line group
    public let lineId: String
    
    /// The platforms on this line
    public let platformGroups: [DeparturePlatformGroup]
}

/// Data grouping some departures under a platform
/// For London Overground and Elizabeth Lines, 'Platform' and 'Direction' should be ignored
public struct DeparturePlatformGroup: Codable {
    
    internal init(platform: String? = nil, direction: String? = nil, departures: [Departure]) {
        self.platform = platform
        self.direction = direction
        self.departures = departures
    }
        
    /// The name of the platform these deprtures are arriving at
    public let platform: String?
    
    /// The direction, on certain tube lines, of these departures
    public let direction: String?
    
    /// The actual departures undeer this platform
    public let departures: [Departure]
}
