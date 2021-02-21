//
//  ProductListViewModelSpecs.swift
//  DubizzleSampleTests
//
//  Created by Sara Awad on 2/21/21.
//

import Foundation
import ReactiveSwift
import Quick
import Nimble
import Cuckoo
import Domain

@testable import DubizzleSample

class ProductListViewModelSpecs: QuickSpec {
    override func spec() {
        var sut: ProductListViewModel!
//        let productList = ProductList.createStub()
//        var getProductListUseCase: MockGetProductListViewModel!
        var scheduler: TestScheduler!

        beforeEach {
            scheduler = TestScheduler()
//            getProductListUseCase = mockGetProductListUseCase(result: .success(productList))
//            sut = ProductListViewModel(useCase: getProductListUseCase)
        }
    }
}

//private func mockGetProductListUseCase(result: Result<ProductList, Swift.Error>) -> MockGetProductListUseCase {
//  let useCase = MockGetProductListUseCase()
//  stub(useCase) { useCase in
//    when(useCase).get().thenReturn(SignalProducer(result: result))
//  }
//  return useCase
//}
