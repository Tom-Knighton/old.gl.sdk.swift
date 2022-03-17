//
//  File.swift
//  
//
//  Created by Tom Knighton on 15/03/2022.
//

import Foundation

extension GLSDK.Vehicles {
    
    /// Returns the upcoming arrivals for a specified vehicle
    /// - Parameter vehicleId: The id of the vehicle, can be found from `GLSDK.StopPoints.GetArrivals(for: )` entries
    /// - Returns: An array of `StopPointArrival` objects `[StopPointArrival]`
    public static func GetArrivals(for vehicleId: String) async -> [StopPointArrival] {
        return await VehicleService.GetVehicleArrivals(for: vehicleId) ?? []
    }
}
