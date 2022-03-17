//
//  File.swift
//  
//
//  Created by Tom Knighton on 07/03/2022.
//

import Foundation

struct JourneyService {
    
    static func GetPossibleJourneys(from: String, to: String, via: String? = nil, time: Date? = nil, timeType: JourneyDateType? = nil) async -> [Journey]? {
        do {
            GLSDKLogger.log("Starting journey")
            var queryParams = "?from=\(from)&to=\(to)\(via == nil ? "" : "&via=\(via ?? "")")"
            
            
            if let time = time {
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "YYYY-MM-dd'T'HH:mm:ss"
                queryParams += "&time=\(dateFormatter.string(from: time))&timeType=\(timeType == nil ? "departAt" : timeType == .arriveAt ? "departAt" : "arriveAt")"
            }
            GLSDKLogger.log("Running")
            GLSDKLogger.log("Journey\(queryParams)")
            return try await APIClient.perform(url: "Journey\(queryParams)", to: [Journey].self)
        }
        catch {
            GLSDKLogger.log(error.localizedDescription, logType: .error)
            return nil
        }
    }
}
