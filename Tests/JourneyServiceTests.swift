//
//  JourneyServiceTests.swift
//
//
//  Created by Tom Knighton on 12/03/2022.
//

import Foundation
import XCTest
import GoLondonSDK

class JourneyServiceTests: XCTestCase {
    
    func testJourney() async throws {
        let startDate = Date()
        let calendar = Calendar.current
        var date = calendar.date(byAdding: .hour, value: 1, to: startDate)
        date = calendar.date(byAdding: .minute, value: 30, to: date ?? Date())
        
        let results = await GLSDK.Journey.MakeJourney(from: "910GGIDEAPK", to: "910GROMFORD", via: nil, time: date, timeType: .arriveAt)
        XCTAssert(!results.isEmpty)
    }
    
    func testJourneyVia() async throws {
        let results = await GLSDK.Journey.MakeJourney(from: "910GGIDEAPK", to: "HUBLST", via: "910GROMFORD")
        XCTAssert(!results.isEmpty)
    }
    
    func testJourneyCoords() async throws {
        
        let results = await GLSDK.Journey.MakeJourney(fromCoords: (51.582, 0.2063), toCoords: (51.5188, 0.0814))
        XCTAssert(!results.isEmpty)
    }
}
