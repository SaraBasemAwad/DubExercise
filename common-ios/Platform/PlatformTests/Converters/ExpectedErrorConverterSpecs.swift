//
//  ExpectedErrorConverterSpecs.swift
//  PlatformTests
//
//  Created by Sara Awad on 2/21/21.
//

import Quick
import Nimble

@testable import Platform

class ExpectedErrorConverterSpecs: QuickSpec {
  override func spec() {
    var sut: ExpectedErrorConverter!
    var expectedResponse: ExpectedErrorResponse!
    let expectedToken = Token()

    beforeEach {
      sut = ExpectedErrorConverter()
    }

    it("converts to expected error") {
      expectedResponse = ExpectedErrorResponse(exception: "Invalid")
      let expectedError = sut.error(from: expectedResponse, for: expectedToken)

      expect(expectedError.localizedDescription) == NSLocalizedString("Product name already exists.", comment: "")
    }
  }
}

private extension ExpectedErrorConverterSpecs {
  struct Token: ExpectedErrorable {
    func expectedError(named name: String) -> ExpectedError? {
      return TestServiceCreationError(name: "NameAlreadyUsedException")
    }
  }
}

enum TestServiceCreationError: Error {
  case nameAlreadyUsed

  init?(name: String) {
    switch name {
    case "NameAlreadyUsedException":        self = .nameAlreadyUsed
    default:                                return nil
    }
  }
}

extension TestServiceCreationError: ExpectedError {
  var errorDescription: String? {
    switch self {
    case .nameAlreadyUsed:
      return NSLocalizedString("Product name already exists.", comment: "")
    }
  }
}

