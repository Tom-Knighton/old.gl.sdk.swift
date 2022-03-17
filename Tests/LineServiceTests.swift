//
//  LineServiceTests.swift
//
//
//  Created by Tom Knighton on 08/03/2022.
//

import Foundation
import XCTest
import GoLondonSDK

class LineServiceTests: XCTestCase {
    
    func testGetDisruptions() async throws {
 
        let results = await GLSDK.Lines.Disruptions(for: LineMode.allCases)
        XCTAssert(!results.isEmpty)
    }
    
    func testGetLineInfoEndpoint() async throws {
        
        let results = await GLSDK.Lines.Lines(lineIds: ["tfl-rail"])
        XCTAssert(!results.isEmpty)
    }
    
    func testGetLineInfoByModeEndpoint() async throws {

        let results = await GLSDK.Lines.Lines(for: LineMode.allCases)
        XCTAssert(!results.isEmpty)
    }
    
    func testGetGeneralStatus() async throws {
        
        let result = await GLSDK.Lines.Status(for: LineMode.allCases)
        XCTAssert(result != LineModeGroupStatusType.unk)
    }
}

