//
//  AppConstants.swift
//  ServerTut
//
//  Created by boyankov on W08 20/Feb/2018 Tue.
//

import Foundation

struct AppConstants {
    
    struct ServerParameters {
        static let port: UInt16 = 8181
        static let rootDirectory: String = "webRoot"
    }
    
    struct HeaderValues {
        static let applicationJSON: String = "application/json"
    }
}
