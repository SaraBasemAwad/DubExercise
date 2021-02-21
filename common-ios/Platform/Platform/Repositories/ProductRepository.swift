//
//  ProductRepository.swift
//  DubizzleSample
//
//  Created by Sara Awad on 2/20/21.
//

import Foundation
import ReactiveSwift
import Moya
import XCGLogger
import Domain

class ProductRepository {
    private let provider: MoyaProvider<ProductService>
    private let productListConverter: ProductListConverter
    private let logger: XCGLogger?
    
    init(provider: MoyaProvider<ProductService> = SessionManager.defaultProvider(),
         productListConverter: ProductListConverter = ProductListConverter(),
         logger: XCGLogger? = nil) {
        self.provider = provider
        self.productListConverter = productListConverter
        self.logger = logger
    }
    
    func get() -> SignalProducer<Domain.ProductList, Swift.Error> {
        return provider
            .defaultRequest(.get, of: ProductListResponse.self)
            .map { [productListConverter] in productListConverter.from($0) }
            .on(failed: { [logger] error in
              logger?.error("Unable to get product list. Error: \(error)")
        })
    }
}
