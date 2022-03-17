//
//  GLSearch.swift
//  
//
//  Created by Tom Knighton on 15/03/2022.
//

extension GLSDK.Search {
    
    /// Searches for `Point` objects based on a common name
    /// - Parameters:
    ///   - name: The common name of the place to search for, i.e. 'Liverpool Street', 'O2', can be partial
    ///   - filterBy: What modes of StopPoint to filter by, can be an empty array or not passed to not filter at all
    ///   - includePOI: Whether or not to include Points of Interest
    ///   - includeAddresses: Whether or not to return addresses
    /// - Returns: A `Point` array `[Point]`
    public static func Search(for name: String, filterBy: [LineMode] = [], includePOI: Bool = false, includeAddresses: Bool = false) async ->  [Point] {
        
        return await SearchService.Search(name: name, filterBy: filterBy, includePOI: includePOI, includeAddresses: includeAddresses) ?? []
    }
    
    /// Searches for `Point` objects around a described lat/lon coordinate
    /// - Parameters:
    ///   - latitude: The latitude to search around as a `Double`
    ///   - longitude: The longitude to search around as a `Double`
    ///   - filterBy: What modes of StopPoint to filter by, can be an empty array or not passed to not filter at all
    ///   - radius: The radius around the lat/lon coordinate to search, default 900
    /// - Returns: A `Point` array `[Point]`
    public static func SearchAround(latitude: Double, longitude: Double, filterBy: [LineMode] = [], radius: Int = 900) async -> [Point] {
        return await SearchService.SearchAround(lat: latitude, lon: longitude, filterBy: filterBy, radius: radius) ?? []
    }
}
