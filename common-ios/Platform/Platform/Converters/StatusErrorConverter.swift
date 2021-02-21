//
//  StatusErrorConverter.swift
//  DubizzleSample
//
//  Created by Sara Awad on 2/20/21.
//

import Foundation

public protocol StatusError: LocalizedError {
    
}

class StatusErrorConverter {
    struct GenericError: StatusError {
      var errorDescription: String? {
        return NSLocalizedString("Could not find error details", comment: "")
      }
    }

    struct HTTPError: StatusError {
      var errorDescription: String?

      init(_ errorDescription: String) {
        self.errorDescription = errorDescription
      }
    }

    func error(from statusCode: Int) -> StatusError {
      switch statusCode {
      case 404:
        return HTTPError(NSLocalizedString("The requested item does not exist.", comment: ""))
      case 502, 503, 504:
        return HTTPError(NSLocalizedString("The remote server is not available. Please try again later.", comment: ""))
      default:
        return defaultError()
      }
    }
}

private extension StatusErrorConverter {
  func defaultError() -> StatusError {
    return GenericError()
  }
}

