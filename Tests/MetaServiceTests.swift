//
//  MetaServiceTests.swift
//
//
//  Created by Tom Knighton on 12/03/2022.
//

import Foundation
import GoLondonSDK
import XCTest

class MetaServiceTests: XCTestCase {
    
    func testGetLineModes() async throws {
        
        let results = await GLSDK.Meta.LineModes
        XCTAssert(!results.isEmpty)
    }
    
    func testGetLineIds() async throws {
        
        let results = await GLSDK.Meta.LineIds(for: .elizabethLine)
        XCTAssert(!results.isEmpty)
    }
    
    func testGetDelayTypes() async throws {
        
        let results = await GLSDK.Meta.DelayTypes
        XCTAssert(!results.isEmpty)
    }
    
    func testLastModifiedRouteCache() async throws {
        
        let time = await GLSDK.Meta.GetLastLineRouteModifiedTime()
        XCTAssertNotNil(time)
    }
    
    func testIradData() async throws {
        
        let data = await GLSDK.Meta.GetAccessibilityData()
        XCTAssert(!data.isEmpty)
    }
    
    func testIradCacheTime() async throws {
        
        let time = await GLSDK.Meta.GetLastAccessibilityCacheTime()
        XCTAssertNotNil(time)
    }
}
