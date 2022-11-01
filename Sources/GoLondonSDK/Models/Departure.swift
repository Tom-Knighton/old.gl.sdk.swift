//
//  Departure.swift
//  
//
//  Created by Tom Knighton on 21/08/2022.
//

import Foundation

/// Data representing a Train/Bus's departure from a StopPoint
public struct Departure: Codable {
    
    public init(platformName: String? = nil, vehicleId: String? = nil, lineId: String, lineMode: LineMode, destinationName: String? = nil, destinationNaptan: String? = nil, estimatedArrival: Date? = nil, estimatedDeparture: Date? = nil, scheduledArrival: Date? = nil, scheduledDeparture: Date? = nil, status: String? = nil, towards: String? = nil, tubeDirection: String? = nil, currentDirection: String? = nil, canonicalDirection: String? = nil, bearing: Int? = nil, stopName: String? = nil,
                naptanId: String? = nil) {
        self.platformName = platformName
        self.vehicleId = vehicleId
        self.lineId = lineId
        self.lineMode = lineMode
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
        self.canonicalDirection = canonicalDirection
        self.stopBearing = bearing
        self.stationName = stopName
        self.naptanId = naptanId
    }

    /// The name of the platform this departure is arriving at
    public let platformName: String?
    
    /// The ID of the vehicle, only works for some tube lines and busses
    public let vehicleId: String?
    
    /// The ID of the line this departure is a part of
    public let lineId: String
    
    /// The LineMode value of this departure type, i.e. dlr or tube
    public let lineMode: LineMode
    
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
    
    /// The canonical direction of this departure, inbound or outbound
    public let canonicalDirection: String?
    
    /// If this departure is at a bus stop, the bearing of the bus stop
    public let stopBearing: Int?
    
    /// If this departure is at a bus stop, the name of the stop
    public let stationName: String?
    
    /// If this departure is at a bus stop, the naptan ID of the stop
    public let naptanId: String?
}

///  Data grouping some platform groups under a line id
public struct DepartureLineGroup: Codable {
    
    public init(lineId: String, lineMode: LineMode, platformGroups: [DeparturePlatformGroup] = []) {
        self.lineId = lineId
        self.lineMode = lineMode
        self.platformGroups = platformGroups
    }
    
    /// The LineID of the line group
    public let lineId: String
    
    /// The LineMode of this line group, i.e. tube , bus, dlr etc.
    public let lineMode: LineMode
    
    /// The platforms on this line
    public let platformGroups: [DeparturePlatformGroup]
}

/// Data grouping some departures under a platform
/// For London Overground and Elizabeth Lines, 'Platform' and 'Direction' should be ignored
public struct DeparturePlatformGroup: Codable {
    
    public init(platform: String? = nil, direction: String? = nil, canonicalDirection: String? = nil, departures: [Departure]) {
        self.platform = platform
        self.direction = direction
        self.departures = departures
        self.canonicalDirection = canonicalDirection
    }
        
    /// The name of the platform these deprtures are arriving at
    public let platform: String?
    
    /// The direction, on certain tube lines, of these departures
    public let direction: String?
    
    /// The actual departures undeer this platform
    public let departures: [Departure]
    
    /// The canonical direction, inbound or outbound, for this platform group
    public let canonicalDirection: String?
}
