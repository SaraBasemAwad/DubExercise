//
//  SessionManager.swift
//  DubizzleSample
//
//  Created by Sara Awad on 2/20/21.
//

import Foundation
import Moya
import Alamofire

class SessionManager {
  static func defaultProvider<TargetType>() -> MoyaProvider<TargetType> {
    var plugins: [PluginType] = []

    if let version = Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as? String {
      plugins.append(VersionPlugin(version: version))
    }

    return provider(with: plugins)
  }

  static func provider<TargetType>(with plugins: [PluginType]) -> MoyaProvider<TargetType> {
    let configuration = URLSessionConfiguration.ephemeral
    configuration.httpAdditionalHeaders = HTTPHeaders.default.dictionary

    let session = Session(configuration: configuration,
                          startRequestsImmediately: false,
                          serverTrustManager: nil)

    return MoyaProvider(session: session, plugins: plugins)
  }

  private static func pinEvaluator(for environment: Environment) -> ServerTrustEvaluating? {
    return DefaultTrustEvaluator(validateHost: false)
  }
}

private class CustomServerTrustManager: ServerTrustManager {
  override func serverTrustEvaluator(forHost host: String) throws -> ServerTrustEvaluating? {
    guard let evaluator = try super.serverTrustEvaluator(forHost: host) else {
      return nil
    }

    return evaluator
  }
}

