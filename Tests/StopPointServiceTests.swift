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
        XCTAssert(result.count == 2)
        XCTAssertNotNil(result.first?.lineModeGroups?.first?.modeName)
        XCTAssert(result.first?.quietTimeData?.containsDaily == false)
        XCTAssert(result.last?.quietTimeData?.dailyCrowding.isEmpty == false)
    }
    
    func testGetArrivals() async throws {
        
        let result = await GLSDK.StopPoints.GetArrivals(for: "HUBLST")
        XCTAssertNotNil(result)
        XCTAssert(result.count > 0)
        let firstDep = result.first?.platformGroups.first?.departures.first
        XCTAssert(((firstDep?.scheduledArrival) != nil) || ((firstDep?.scheduledDeparture) != nil) || ((firstDep?.estimatedArrival) != nil) || ((firstDep?.estimatedDeparture) != nil))
    }
    
    func testGetTimetableReturnsOk() async throws {
        //Act
        let result = await GLSDK.StopPoints.GetTimetable(for: "940GZZLUSTD", lineId: "jubilee")
        
        //Assert
        XCTAssertNotNil(result)
        XCTAssertEqual(result.count, 2)
        XCTAssertNotNil(result.first?.schedules)
        XCTAssert(result.first?.schedules.isEmpty == false)
    }
    
    
    func testGetTimetableForInvalidStopReturnsEmpty() async throws {
        //Act
        let result = await GLSDK.StopPoints.GetTimetable(for: "940GZZLUSTD", lineId: "jjjj")
        
        //Assert
        XCTAssertNotNil(result)
        XCTAssert(result.isEmpty)
    }
}
