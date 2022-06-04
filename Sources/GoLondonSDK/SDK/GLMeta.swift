//
//  GLMeta.swift
//  
//
//  Created by Tom Knighton on 15/03/2022.
//

import Foundation


extension GLSDK.Meta {
    
    /// All the `LineModes` operated under the TfL API
    /// - Remark: Async call
    public static var LineModes: [LineMode] {
        get async {
            return await MetaService.GetLineModes() ?? []
        }
    }
    
    /// Returns the ids of all lines operating under a `LineMode`
    /// - Parameter lineMode: The LineMode to get line ids for
    /// - Returns: The line ids as a `[String]`
    public static func LineIds(for lineMode: LineMode) async -> [String] {
        return await MetaService.GetLineIdsForModes(lineModes: [lineMode]) ?? []
    }
    
    /// Returns the ids of all lines operating under all specified `LineMode`s
    /// - Parameter lineModse: The LineModes to get line ids for
    /// - Returns: The line ids as a `[String]`
    public static func LineIds(for lineModes: [LineMode]) async -> [String] {
        return await MetaService.GetLineIdsForModes(lineModes: lineModes) ?? []
    }
    
    /// All possible `DisruptionDelayType`s
    /// - Remark: Async call
    public static var DelayTypes: [DisruptionDelayType] {
        get async {
            return await MetaService.GetDelayTypes() ?? []
        }
    }
    
    /// Returns the last time the line route cache was modified in the API
    ///
    /// This can be used to determine whether to re-query `GLSDK.Lines.Routes()` if you cached it last time
    /// - Returns: A Date, if one exists, from the API
    public static func GetLastLineRouteModifiedTime() async -> Date? {
        return await MetaService.GetLastModifiedRouteTime()
    }
    
    
    /// Returns TfL's accessibility data for stop points
    public static func GetAccessibilityData() async -> [StopPointAccessibility] {
        return await MetaService.GetAccessibiltyData() ?? []
    }
    
    /// Returns the last time the accessibility data was cached by Go London's API
    public static func GetLastAccessibilityCacheTime() async -> Date? {
        return await MetaService.GetLastAccessibilityCacheTime()
    }
}
