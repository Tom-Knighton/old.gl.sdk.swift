//
//  LineService.swift
//  
//
//  Created by Tom Knighton on 07/03/2022.
//

import Foundation

struct LineService {
    
    static func GetDisruptions(for lineMode: LineMode) async -> [Disruption]? {
        do {
            return try await APIClient.perform(url: "Line/Disruptions/?lineMode=\(lineMode.rawValue)", to: [Disruption].self) ?? []
        } catch {
            GLSDKLogger.log("Error decoding Line/Disruptions result \(error.localizedDescription)", logType: .error)
            return nil
        }
    }
    
    static func GetLineInfo(for lineIds: [String], includeDetail: Bool = false) async -> [Line]? {
        do {
            return try await APIClient.perform(url: "Line/GetLineInfo/\(lineIds.joined(separator: ","))?includeDetail=\(includeDetail)", to: [Line].self) ?? []
        } catch {
            GLSDKLogger.log("Error decoding Line/Disruptions result \(error.localizedDescription)", logType: .error)
            return nil
        }
    }
    
    static func GetLineInfo(for lineModes: [LineMode], includeDetail: Bool = false) async -> [Line]? {
        do {
            var queryString = "?"
            for lineMode in lineModes {
                queryString += "lineModes=\(lineMode.rawValue)&"
            }
            queryString.removeLast()
            
            return try await APIClient.perform(url: "Line/GetLineInfoForModes/\(queryString)&includeDetail=\(includeDetail)", to: [Line].self) ?? []
        } catch {
            GLSDKLogger.log("Error decoding Line/Disruptions result \(error.localizedDescription)", logType: .error)
            return nil
        }
    }
    
    static func GetGeneralStatusString(for lineModes: [LineMode]) async -> LineModeGroupStatusType {
        do {
            var queryString = "?"
            for lineMode in lineModes {
                queryString += "lineModes=\(lineMode.rawValue)&"
            }
            queryString.removeLast()
            return try await APIClient.perform(url: "Line/StatusOverview\(queryString)", to: LineModeGroupStatusType.self) ?? .unk
        }
        catch {
            return .unk
        }
    }
}
