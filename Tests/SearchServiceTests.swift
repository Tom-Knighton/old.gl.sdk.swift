//
//  SearchServiceTests.swift
//
//
//  Created by Tom Knighton on 12/03/2022.
//

import Foundation
import GoLondonSDK
import XCTest

class SearchServiceTests: XCTestCase {
    
    func testSearchAround() async throws {
        
        let results = await GLSDK.Search.SearchAround(latitude: 51.841, longitude: 0.1190)
        XCTAssert(!results.isEmpty)
    }

    func testSearch() async throws {
        
        let results = await GLSDK.Search.Search(for: "Gidea Park", filterBy: [], includePOI: true, includeAddresses: true)
        XCTAssert(!results.isEmpty)
        
        let results2 = await GLSDK.Search.Search(for: "Stratford", filterBy: [], includePOI: true, includeAddresses: true)
        XCTAssert(!results2.isEmpty)
        
        var modes: [LineMode] = []
        let combResults = results + results2
        combResults.forEach {
            if let p = $0 as? StopPoint {
                modes.append(contentsOf: p.lineModes ?? [])
            }
        }
        
        XCTAssert(modes.filter { $0 == LineMode.unknown }.count != modes.count)
        
        let results3 = await GLSDK.Search.Search(for: "This is an unknown field :)", filterBy: [], includePOI: true, includeAddresses: true)
        XCTAssertNotNil(results3)
    }

}
