//
//  File.swift
//  
//
//  Created by Tom Knighton on 12/03/2022.
//

import Foundation

extension GLSDK.Journey {
    
    
    /// Gets a list of possible journeys, sorted by time, from a specified location to another specified location
    /// - Parameters:
    ///   - from: Where to depart from. Can be an ICS Id or Stop Point ID
    ///   - to: Where to arrive. Can be an ICS Id or Stop Point ID
    ///   - via: Where to pass through, can be nil, ICS ID, Stop Point ID or coordinates as a string {lat,lon}
    ///   - time: A time to either arrive at or depart from, can be nil
    ///   - timeType: Whether the time above is to arrive at, or depart from
    /// - Returns: An array of Journey objects, will be an empty array if no journeys can be made
    public static func MakeJourney(from: String, to: String, via: String? = nil, time: Date? = nil, timeType: JourneyDateType? = .arriveAt) async -> [Journey] {
        return await JourneyService.GetPossibleJourneys(from: from, to: to, via: via, time: time, timeType: timeType) ?? []
    }
    
    /// Gets a list of possible journeys, sorted by time, from a specified location to another specified location
    /// - Parameters:
    ///   - fromCoords: Where to depart from as lat,lon coordinates
    ///   - to: Where to arrive. Can be an ICS Id or Stop Point ID
    ///   - via: Where to pass through, can be nil, ICS ID, Stop Point ID or coordinates as a string {lat,lon}
    ///   - time: A time to either arrive at or depart from, can be nil
    ///   - timeType: Whether the time above is to arrive at, or depart from
    /// - Returns: An array of Journey objects, will be an empty array if no journeys can be made
    public static func MakeJourney(fromCoords: (Float, Float), to: String, via: String? = nil, time: Date? = nil, timeType: JourneyDateType? = .arriveAt) async -> [Journey] {
        return await MakeJourney(from: "\(fromCoords.0),\(fromCoords.1)", to: to, via: via, time: time, timeType: timeType)
    }
    
    /// Gets a list of possible journeys, sorted by time, from a specified location to another specified location
    /// - Parameters:
    ///   - fromCoords: Where to depart from as lat,lon coordinates
    ///   - toCoords: Where to arrive at, as lat,lon coordinates
    ///   - via: Where to pass through, can be nil, ICS ID, Stop Point ID or coordinates as a string {lat,lon}
    ///   - time: A time to either arrive at or depart from, can be nil
    ///   - timeType: Whether the time above is to arrive at, or depart from
    /// - Returns: An array of Journey objects, will be an empty array if no journeys can be made
    public static func MakeJourney(fromCoords: (Float, Float), toCoords: (Float, Float), via: String? = nil, time: Date? = nil, timeType: JourneyDateType? = .arriveAt) async -> [Journey] {
        return await MakeJourney(from: "\(fromCoords.0),\(fromCoords.1)", to: "\(toCoords.0),\(toCoords.1)", via: via, time: time, timeType: timeType)
    }
    
    /// Gets a list of possible journeys, sorted by time, from a specified location to another specified location
    /// - Parameters:
    ///   - from: Where to depart from. Can be an ICS Id or Stop Point ID
    ///   - toCoords: Where to arrive at as lat,lon coordinates
    ///   - via: Where to pass through, can be nil, ICS ID, Stop Point ID or coordinates as a string {lat,lon}
    ///   - time: A time to either arrive at or depart from, can be nil
    ///   - timeType: Whether the time above is to arrive at, or depart from
    /// - Returns: An array of Journey objects, will be an empty array if no journeys can be made
    public static func MakeJourney(from: String, toCoords: (Float, Float), via: String? = nil, time: Date? = nil, timeType: JourneyDateType? = .arriveAt) async -> [Journey] {
        return await MakeJourney(from: from, to: "\(toCoords.0),\(toCoords.1)", via: via, time: time, timeType: timeType)
    }
}
