//
//  AppVersionHelpers.swift
//  DubizzleSample
//
//  Created by Sara Awad on 2/20/21.
//

import Foundation

enum AppVersionHelpers {
  static func formatVersion(_ version: String?, build: String?) -> String {
    switch (version, build) {
    case let (version?, build?):  return format(version: version, build: build)
    case let (version?, _):       return version
    default:                      return NSLocalizedString("N/A", comment: "")
    }
  }
}

private extension AppVersionHelpers {
  static func format(version: String, build: String) -> String {
    guard version == build else {
      let format = NSLocalizedString("%@.%@", comment: "")
      return String(format: format, version, build)
    }

    return version
  }
}
