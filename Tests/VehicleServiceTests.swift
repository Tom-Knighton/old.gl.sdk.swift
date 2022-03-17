//
//  VehicleServiceTests.swift
//
//
//  Created by Tom Knighton on 12/03/2022.
//

import Foundation
import GoLondonSDK
import XCTest

class VehicleServiceTests: XCTestCase {
    
    func testGetArrivalsFirstAtLST() async throws{
        
        let firstAtLST = await GLSDK.StopPoints.GetArrivals(for: "HUBLST")
        let vehId = firstAtLST.first?.platformGroups?.first?.arrivals?.first?.vehicleId ?? "noVehicleId"
        
        let result = await GLSDK.Vehicles.GetArrivals(for: vehId)
        XCTAssert(!result.isEmpty)
    }
}
