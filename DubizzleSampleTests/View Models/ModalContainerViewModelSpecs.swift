//
//  ModalContainerViewModelSpecs.swift
//  DubizzleSampleTests
//
//  Created by Sara Awad on 2/21/21.
//

import Quick
import Nimble
import ReactiveSwift
import Cuckoo

@testable import DubizzleSample

class ModalContainerViewModelSpecs: QuickSpec {
  override func spec() {
    var sut: ModalContainerViewModel!
    var scheduler: TestScheduler!
    let title = "Tab 1"

    beforeEach {
      sut = ModalContainerViewModel(title: title, position: .center)
      scheduler = TestScheduler()
    }

    describe("position") {
      context("when set to center") {
        it("returns a default offset") {
          expect(sut.outputs.offset.value) == CGPoint.zero
        }
      }

      context("when set to a custom value") {
        let xOffset: CGFloat = 20
        let yOffset: CGFloat = 30
        let offset = CGPoint(x: xOffset, y: yOffset)

        beforeEach {
          sut = ModalContainerViewModel(title: title, position: .offset(xOffset, yOffset))
        }

        it("returns an offset") {
          expect(sut.outputs.offset.value) == offset
        }
      }
    }

    describe("has title") {
      context("when title is nil") {
        beforeEach {
          sut = ModalContainerViewModel(title: nil, position: .center)
        }

        it("returns false") {
          expect(sut.outputs.hasTitle.value) == false
        }
      }

      context("when title is empty") {
        beforeEach {
          sut = ModalContainerViewModel(title: "", position: .center)
        }

        it("returns false") {
          expect(sut.outputs.hasTitle.value) == false
        }
      }

      context("when title is not empty") {
        beforeEach {
          sut = ModalContainerViewModel(title: "Test Title", position: .center)
        }

        it("returns true") {
          expect(sut.outputs.hasTitle.value) == true
        }
      }
    }
  }
}

