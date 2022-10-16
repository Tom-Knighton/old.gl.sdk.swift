//
//  File.swift
//  
//
//  Created by Tom Knighton on 07/03/2022.
//

import Foundation

struct StopPointService {
    
    static func GetBy(ids: [String]) async -> [StopPoint]? {
        
        guard ids.count > 0 else {
            GLSDKLogger.log("Must pass at least one stop ID", logType: .error)
            return nil
        }
        
        do {
            return try await APIClient.perform(url: "StopPoint/\(ids.joined(separator: ","))", to: [StopPoint].self)
        } catch {
            GLSDKLogger.log("Error decoding results \(error.localizedDescription)")
            return nil
        }
    }
    
    static func GetEstimatedArrivals(for id: String) async -> [DepartureLineGroup]? {
        
        do {
            return try await APIClient.perform(url: "StopPoint/EstimatedArrivals/\(id)", to: [DepartureLineGroup].self)
        } catch {
            GLSDKLogger.log("Error decoding results \(error.localizedDescription)")
            return nil
        }
    }
    
    static func GetTimetable(for stopPoint: String, lineId: String, direction: String? = nil) async -> [StopPointTimetable] {
        do {
            var url = "StopPoint/\(stopPoint)/timetable/\(lineId)"
            if let direction {
                url += "?direction=\(direction)"
            }
            return try await APIClient.perform(url: url, to: [StopPointTimetable].self) ?? []
        } catch {
            GLSDKLogger.log("Error decoding results \(error.localizedDescription)")
            return []
        }
    }
}
