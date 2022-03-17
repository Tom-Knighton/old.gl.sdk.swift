//
//  MetaService.swift
//  
//
//  Created by Tom Knighton on 07/03/2022.
//

import Foundation

struct MetaService {
    
    static func GetLineModes() async -> [LineMode]? {
        do {
            return try await APIClient.perform(url: "Meta/LineModes", to: [LineMode].self)
        } catch {
            return nil
        }
    }
    
    static func GetLineIdsForModes(lineModes: [LineMode]) async -> [String]? {
        
        guard lineModes.count > 0, let firstMode = lineModes.first else {
            return nil
        }
        
        do {
            var query = "?modes=\(firstMode)"
            for lineMode in lineModes.dropFirst() {
                query += "&modes=\(lineMode.rawValue)"
            }
            
            return try await APIClient.perform(url: "Meta/LineIds\(query)", to: [String].self)
        } catch {
            return nil
        }
    }
    
    static func GetDelayTypes() async -> [DisruptionDelayType]? {
        do {
            return try await APIClient.perform(url: "Meta/DelayTypes", to: [DisruptionDelayType].self)
        } catch {
            return nil
        }
    }
}
