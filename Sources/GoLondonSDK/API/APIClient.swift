//
//  APIClient.swift
//  
//
//  Created by Tom Knighton on 04/03/2022.
//

import Foundation

struct APIClient {
    
    private static let BASEURL = "https://old.api.golondon.tomk.online/api/"
    
    static func perform<T: Decodable>(url: String, to type: T.Type) async throws -> T? {
        let data = await performNoDecoding(url: url)
        guard let data = data else {
            return nil
        }
        
        return try data.decode(to: T.self)
    }
    
    static func performNoDecoding(url: String) async -> Data? {
        
        guard let baseurl = URL(string: BASEURL),
              let url = url.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed),
              let url = URL(string: url, relativeTo: baseurl) else {
            return nil
        }
        
        GLSDKLogger.log(url.absoluteString)
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            return data
        } catch {
            print(String(describing: error))
            return nil
        }
    }
}
