//
//  UseCaseProvider.swift
//  DubizzleSample
//
//  Created by Sara Awad on 2/20/21.
//

import Foundation
import Domain
import XCGLogger

public class UseCaseProvider: Domain.UseCaseProvider {
    private let productRepository: ProductRepository
    private let logger: XCGLogger?
    
    public init(logger: XCGLogger?) {
        self.logger = logger
        productRepository = ProductRepository(logger: logger)
    }
    
    public func makeGetProductListUseCase() -> Domain.GetProductListUseCase {
        return GetProductListUseCase(repository: productRepository)
    }
}
