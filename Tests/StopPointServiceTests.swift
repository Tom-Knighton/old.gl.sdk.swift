//
//  StopPointServiceTests.swift
//  
//
//  Created by Tom Knighton on 12/03/2022.
//

import Foundation
import GoLondonSDK
import XCTest

class StopPointServiceTests: XCTestCase {
    
    func testGetByIds() async throws {
        
        let result = await GLSDK.StopPoints.Get(ids: ["910GGIDEAPK", "HUBLST"])
        XCTAssertNotNil(result)
        XCTAssert(result.count > 0)
    }
    
    func testGetArrivals() async throws {
        
        let result = await GLSDK.StopPoints.GetArrivals(for: "HUBLST")
        XCTAssertNotNil(result)
        XCTAssert(result.count > 0)
    }
}
