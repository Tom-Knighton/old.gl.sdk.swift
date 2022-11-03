//
//  LineDirection.swift
//  
//
//  Created by Tom Knighton on 03/11/2022.
//

import Foundation


/// A direction along a line, either inbound or outbound
public enum LineDirection: String, Codable, CaseIterable {
    case inbound = "inbound"
    case outbound = "outbound"
}
