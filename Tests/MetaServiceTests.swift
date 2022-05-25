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
}
