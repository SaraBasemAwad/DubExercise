//
//  Environment.swift
//  DubizzleSample
//
//  Created by Sara Awad on 2/20/21.
//

import Foundation

class Environment {
    
    enum Constants {
        static let versionKey = "CFBundleShortVersionString"
        static let buildKey = "CFBundleVersion"
    }
    
    static let environment = Environment()
    
    let basePath: String = "https://ey3f2y0nre.execute-api.us-east-1.amazonaws.com"
}

extension Environment {

    var currentAppVersion: (version: String?, build: String?) {
        return (versionNumber(), buildNumber())
    }
    
    func versionNumber(bundle: Bundle = Bundle.main) -> String? {
      return bundle.object(forInfoDictionaryKey: Constants.versionKey) as? String
    }

    func buildNumber(bundle: Bundle = Bundle.main) -> String? {
      return bundle.object(forInfoDictionaryKey: Constants.buildKey) as? String
    }
    
    func url(bundle: Bundle = Bundle.main) -> URL {
         guard let url = URL(string: basePath) else {
              fatalError("Invalid URL to REST service.")
        }
      return url
    }
}
