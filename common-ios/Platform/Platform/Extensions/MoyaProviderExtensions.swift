//
//  MoyaProviderExtensions.swift
//  DubizzleSample
//
//  Created by Sara Awad on 2/20/21.
//

import Foundation
import Moya
import ReactiveSwift

extension MoyaProvider {
    func defaultRequest<T: Decodable>(_ token: Target, of responseType: T.Type) -> SignalProducer<T, Swift.Error> {
      return baseDefaultRequest(token, of: responseType).mapServiceError { error in
        return ServiceErrorHelper.error(from: error)
      }
    }

    func defaultRequest(_ token: Target) -> SignalProducer<Never, Swift.Error> {
      return baseDefaultRequest(token).mapServiceError { error in
        return ServiceErrorHelper.error(from: error)
      }
    }
}


extension MoyaProvider {
  func baseDefaultRequest<T: Decodable>(_ token: Target, of responseType: T.Type) -> SignalProducer<T, MoyaError> {
    return reactive.request(token).filterSuccessfulStatusCodes().map(responseType, using: MoyaProvider.defaultDecoder())
  }

  func baseDefaultRequest(_ token: Target) -> SignalProducer<Never, MoyaError> {
    return reactive.request(token).filterSuccessfulStatusCodes().then(SignalProducer<Never, MoyaError>.empty)
  }
}

private extension SignalProducer where Error == MoyaError {
  func mapServiceError(_ transform: @escaping (Response) -> Swift.Error) -> SignalProducer<Value, Swift.Error> {
    return producer.mapError { error in
      switch error {
      case .statusCode(let response): return transform(response)
      default:                        return error
      }
    }
  }
}

extension MoyaProvider {
  static func defaultDecoder() -> JSONDecoder {
    let decoder = JSONDecoder()
    return decoder
  }
}
