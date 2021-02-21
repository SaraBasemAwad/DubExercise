//
//  ServiceErrorHelper.swift
//  DubizzleSample
//
//  Created by Sara Awad on 2/20/21.
//

import Foundation
import Moya

class ServiceErrorHelper {
    class func error(from response: Response) -> Swift.Error {
      switch response.statusCode {
      case let code: return statusErrorFrom(code: code)
      }
    }
    
    class func error<T: ExpectedErrorable>(from response: Response, for token: T) -> Swift.Error {
      switch response.statusCode {
      case let code:  return statusErrorFrom(code: code)
      }
    }
}

private extension ServiceErrorHelper {

  class func statusErrorFrom(code: Int) -> Swift.Error {
    let converter = StatusErrorConverter()
    return converter.error(from: code)
  }

  class func defaultError() -> Swift.Error {
    return NSError(domain: "", code: 1, userInfo:  [NSLocalizedDescriptionKey: "Unknown Failure"])
  }
}
