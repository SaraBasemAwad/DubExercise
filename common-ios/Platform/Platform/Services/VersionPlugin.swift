//
//  VersionPlugin.swift
//  DubizzleSample
//
//  Created by Sara Awad on 2/20/21.
//

import Foundation
import Moya

class VersionPlugin: PluginType {
  private let version: String

  init(version: String) {
    self.version = version
  }

  func prepare(_ request: URLRequest, target: TargetType) -> URLRequest {
    var request = request
    request.allHTTPHeaderFields?["Accept", default: "*/*"] += "; version=\(version)"
    return request
  }
}
