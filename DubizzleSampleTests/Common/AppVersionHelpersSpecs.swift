//
//  AppVersionHelpersSpecs.swift
//  DubizzleSampleTests
//
//  Created by Sara Awad on 2/21/21.
//

import Quick
import Nimble

@testable import DubizzleSample

class AppVersionHelpersSpecs: QuickSpec {
  override func spec() {
    describe("formatVersion") {
      context("when version number is set") {
        context("and build number is set") {
          it("returns version number combined with build number") {
            let result = AppVersionHelpers.formatVersion("version", build: "build")
            expect(result) == "version.build"
          }
        }

        context("and build number is identical") {
          it("returns only version number") {
            let result = AppVersionHelpers.formatVersion("version", build: "version")
            expect(result) == "version"
          }
        }

        context("and build number is not set") {
          it("returns version number") {
            let result = AppVersionHelpers.formatVersion("version", build: nil)
            expect(result) == "version"
          }
        }
      }

      context("when version number is not set") {
        context("and build number is set") {
          it("returns default text") {
            let result = AppVersionHelpers.formatVersion(nil, build: "build")
            expect(result) == "N/A"
          }
        }

        context("and build number is not set") {
          it("returns default text") {
            let result = AppVersionHelpers.formatVersion(nil, build: nil)
            expect(result) == "N/A"
          }
        }
      }
    }
  }
}
