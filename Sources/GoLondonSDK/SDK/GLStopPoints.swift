//
//  File.swift
//  
//
//  Created by Tom Knighton on 12/03/2022.
//

import Foundation

extension GLSDK.StopPoints {
    
    
    /// Gets a list of StopPoints from their Ids
    /// - Parameter ids: The list of Ids (StopPoint.id) to search for
    /// - Remark: Returns an empty array if no StopPoints were found
    public static func Get(ids: [String]) async -> [StopPoint] {
        return await StopPointService.GetBy(ids: ids) ?? []
    }
    
    /// Returns a list of DepartureLineGroups, sorted by time, platform and line, for a given StopPoint Id
    /// - Parameter id: The Id (StopPoint.id) of the StopPoint
    /// - Remark: Returns an array of DepartureLineGroup objects
    public static func GetArrivals(for id: String) async -> [DepartureLineGroup] {
        return await StopPointService.GetEstimatedArrivals(for: id) ?? []
    }
    
    
    /// Returns a list of timetables for a line at a stop point, optionally filter to one direction
    /// - Parameters:
    ///   - id: The naptan id of the stop point (i.e. no hubs)
    ///   - lineId: the id of the line i.e. 'jubilee'
    ///   - direction: Inbound or outbound
    public static func GetTimetable(for id: String, lineId: String, direction: String? = nil) async -> [StopPointTimetable] {
        return await StopPointService.GetTimetable(for: id, lineId: lineId, direction: direction)
    }
}
