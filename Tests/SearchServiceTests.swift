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
    }

}
