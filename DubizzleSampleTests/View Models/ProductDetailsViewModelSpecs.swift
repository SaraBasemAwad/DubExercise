//
//  ProductDetailsViewModelSpecs.swift
//  DubizzleSampleTests
//
//  Created by Sara Awad on 2/21/21.
//

import Quick
import Nimble
import ReactiveSwift
import ReactiveCocoa
import Cuckoo

@testable import DubizzleSample

class ProductDetailsViewModelSpecs: QuickSpec {
  override func spec() {
    var sut: ProductDetailsViewModel!
    var scheduler: TestScheduler!

    beforeEach {
      let product = ProductPresentableModel(name: "Laptop", price: "AED 3,000", imageURL: URL(string: ""))
      sut = ProductDetailsViewModel(product: Property(value: product))
      scheduler = TestScheduler()
    }
    
    describe("selected product") {
      it("returns selected product") {
        let result = sut.outputs.product.value
        expect(result?.name) == "Laptop"
        expect(result?.price) == "AED 3,000"
      }
    }
  }
}
