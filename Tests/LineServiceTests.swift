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
        
        let results = await GLSDK.Lines.Lines(lineIds: ["elizabeth"])
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
    
    func testLineRoutes() async throws {
        
        let results = await GLSDK.Lines.Routes(for: ["elizabeth"])
        XCTAssert(!results.isEmpty)
    }
    
    func testLineRoutesVsFixCoords() async throws {
        
        let unfixedResults = await GLSDK.Lines.Routes(for: ["elizabeth", "central"], fixCoordinates: false)
        let fixedResults = await GLSDK.Lines.Routes(for: ["elizabeth", "central"])
        
        XCTAssert(unfixedResults.jsonEncode() != fixedResults.jsonEncode())
    }
    
    func testRouteLineMapIsFilled() async throws {
        
        let results = await GLSDK.Lines.Routes(for: "central")
        
        let firstCoord = results?.lineMapRoutes?.first?.first
        XCTAssertNotNil(firstCoord)
        XCTAssert(firstCoord?[0] != 0)
        XCTAssert(firstCoord?[1] != 0)
    }
    
    func testRoutesDirectionValid() async throws {
        
        let resultIn = await GLSDK.Lines.Routes(for: "central", direction: .inbound)
        let resultOut = await GLSDK.Lines.Routes(for: "central", direction: .outbound)
        
        XCTAssertNotNil(resultIn)
        XCTAssertNotNil(resultOut)
        XCTAssert(resultIn?.stopPointSequences?.first?.stopPoint?.first?.id != resultOut?.stopPointSequences?.first?.stopPoint?.first?.id)
    }
}

