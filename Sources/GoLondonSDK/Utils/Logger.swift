//
//  Logger.swift
//
//
//  Created by Tom Knighton on 07/03/2022.
//

import Foundation

struct GLSDKLogger {
    
    enum logType {
        case info, warn, error
        
        var desc: String {
            switch self {
            case .info:
                return "Info:"
            case .warn:
                return "Warn!:"
            case .error:
                return "ERROR:"
            }
        }
        
    }
    
    static func log(_ msg: String, logType: logType = .info) {
        print("[GLSDK] \(logType.desc) \(msg)")
    }
}
