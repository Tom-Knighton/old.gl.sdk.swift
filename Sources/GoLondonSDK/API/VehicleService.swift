//
//  VehicleService.swift
//  
//
//  Created by Tom Knighton on 07/03/2022.
//

import Foundation

struct VehicleService {
    
    static func GetVehicleArrivals(for vehicleId: String) async -> [StopPointArrival]? {
        
        do {
            return try await APIClient.perform(url: "Vehicle/\(vehicleId)/Arrivals", to: [StopPointArrival].self)
        } catch {
            GLSDKLogger.log("Error decoding result: \(error.localizedDescription)")
            return nil
        }
    }
}
