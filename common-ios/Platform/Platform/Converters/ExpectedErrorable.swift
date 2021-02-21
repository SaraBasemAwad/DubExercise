//
//  ExpectedErrorable.swift
//  DubizzleSample
//
//  Created by Sara Awad on 2/20/21.
//

import Foundation

public protocol ExpectedError: LocalizedError {
}

protocol ExpectedErrorable {
  func expectedError(named name: String) -> ExpectedError?
}

class ExpectedErrorConverter {
  struct GenericError: ExpectedError {
    var errorDescription: String? {
      return NSLocalizedString("Could not find error details", comment: "")
    }
  }

  func error<T: ExpectedErrorable>(from response: ExpectedErrorResponse, for token: T) -> ExpectedError {
    return token.expectedError(named: response.exception) ?? defaultError()
  }
}

private extension ExpectedErrorConverter {
  func defaultError() -> ExpectedError {
    return GenericError()
  }
}
