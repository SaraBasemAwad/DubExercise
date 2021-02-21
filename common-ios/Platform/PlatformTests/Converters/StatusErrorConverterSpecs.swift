//
//  StatusErrorConverterSpecs.swift
//  PlatformTests
//
//  Created by Sara Awad on 2/21/21.
//

import Quick
import Nimble

@testable import Platform

class StatusErrorConverterSpecs: QuickSpec {
  override func spec() {
    var sut: StatusErrorConverter!
    let expectedStatusCode = 1
    let expectedError = StatusErrorConverter.GenericError()

    beforeEach {
      sut = StatusErrorConverter()
    }

    it("converts to status error") {
      let statusError = sut.error(from: expectedStatusCode)

      expect(statusError.localizedDescription) == expectedError.localizedDescription
    }
  }
}

