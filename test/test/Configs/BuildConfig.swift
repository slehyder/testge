//
//  BuildConfig.swift
//  test
//
//  Created by Slehyder Martinez on 13/11/24.
//

import Foundation

enum BuildConfigConstants: String {
    case BASE_URL = "BASE_URL"
}

struct BuildConfig {

    static func getURL(for config: BuildConfigConstants) -> String {
        if let path = infoDict[config.rawValue] as? String {
            return path
        }
        return ""
    }
    
    static func getURL(for config: BuildConfigConstants, path: String) -> String {
        return BuildConfig.getURL(for: config) + path
    }
    
    static let infoDict: [String: Any] = {
        guard let dict = Bundle.main.infoDictionary else {
            return [:]
        }
        return dict
    }()

}


