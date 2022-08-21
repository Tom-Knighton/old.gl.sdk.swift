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
}
