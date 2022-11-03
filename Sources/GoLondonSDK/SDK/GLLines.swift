//
//  File.swift
//  
//
//  Created by Tom Knighton on 12/03/2022.
//

import Foundation

extension GLSDK.Lines {
    
    
    /// Gets a list of disruptions affecting the specified LineMode
    /// - Parameter lineMode: The LineMode to check for disruptions for
    /// - Remark: Returns an empty array if no disruptions are found
    public static func Disruptions(for lineMode: LineMode) async -> [Disruption] {
        return await LineService.GetDisruptions(for: lineMode) ?? []
    }
    
    /// Gets a list of disruptions affecting the specified LineModes
    /// - Parameter lineModes: An array of LineModes to check for disruptions for
    /// - Remark: Returns an empty array if no disruptions are found
    public static func Disruptions(for lineModes: [LineMode]) async -> [Disruption] {
        var disruptions: [Disruption] = []
        for lineMode in lineModes {
            disruptions += await LineService.GetDisruptions(for: lineMode) ?? []
        }
        return disruptions
    }
    
    
    /// Gets the `Line` object and info for a specified LineId
    /// - Parameters:
    ///   - lineId: The LineId of the line to search for
    ///   - includeDetails: Whether or not to include any disruption details and causes
    /// - Returns: The Line object, if found. Returns nil if `lineId` was invalid
    public static func Line(lineId: String, includeDetails: Bool = false) async -> Line? {
        return await LineService.GetLineInfo(for: [lineId], includeDetail: includeDetails)?.first ?? nil
    }
    
    /// Gets the `Line` objects and info for specified LineIds
    /// - Parameters:
    ///   - lineIds: An array of Ids to search for
    ///   - includeDetails: Whether or not to include any disruption details and causes
    /// - Returns: An array of `Line` objects for all valid LineIds, returns an empty array if none were found
    public static func Lines(lineIds: [String], includeDetails: Bool = false) async -> [Line] {
        return await LineService.GetLineInfo(for: lineIds, includeDetail: includeDetails) ?? []
    }
    
    /// Gets all the `Line`s for a specified LineMode
    /// - Parameters:
    ///   - mode: The LineMode to get Lines for
    ///   - includeDetails: Whether or not to include any disruption details and causes
    /// - Returns: An array of `Line` objects for all lines running for the LineMode, returns an empy array if none were found
    public static func Lines(for mode: LineMode, includeDetails: Bool = false) async -> [Line] {
        return await LineService.GetLineInfo(for: [mode], includeDetail: includeDetails) ?? []
    }
    
    /// Gets all the `Line`s for all specified LineModes
    /// - Parameters:
    ///   - modes: The LineModes to get Lines for
    ///   - includeDetails: Whether or not to include any disruption details and causes
    /// - Returns: An array of `Line` objects for all lines running for each LineMode, returns an empy array if none were found
    public static func Lines(for modes: [LineMode], includeDetails: Bool = false) async -> [Line] {
        return await LineService.GetLineInfo(for: modes, includeDetail: includeDetails) ?? []
    }
    
    /// Gets the general/overview status for a group of `LineMode`s
    /// - Parameter lineModes: The `LineMode`s to get the general status of
    /// - Returns: A string, from `LineModeGroupStatusType` enum
    public static func Status(for lineModes: [LineMode]) async -> LineModeGroupStatusType {
        return await LineService.GetGeneralStatusString(for: lineModes)
    }
    
    
    /// Returns an array of line ids and their routes with branches, with ordered stop points on each branch
    /// - Parameter lineIds: The ids of the lines to return routes for, i.e. 'elizabeth' and 'bakerloo'
    /// - Parameter fixCoordinates: Whether or not to merge stop points with the same Ics Id to the same coordinate, defaults to true
    /// - Returns: An array of `LineRoutes` objects
    public static func Routes(for lineIds: [String], fixCoordinates: Bool = true) async -> [LineRoutes] {
        return await LineService.GetLineRoutes(for: lineIds, fixCoordinates: fixCoordinates) ?? []
    }
    
    
    /// Returns a `LineRoutes` object that contains the line id and a series of branches with ordered stop points
    /// - Parameter lineId: The id of the line, i.e. 'elizabeth' or 'bakerloo'
    /// - Parameter fixCoordinates: Whether or not to merge stop points with the same Ics Id to the same coordinate, defaults to true
    /// - Returns: A `LineRoutes` object 
    public static func Routes(for lineId: String, fixCoordinates: Bool = true, direction: LineDirection = .outbound) async -> LineRoutes? {
        return await LineService.GetLineRoutes(for: lineId, fixCoordinates: fixCoordinates, direction: direction)
    }
}
