//
//  GetProductListUseCase.swift
//  DubizzleSample
//
//  Created by Sara Awad on 2/20/21.
//

import Foundation
import ReactiveSwift
import Domain

class GetProductListUseCase: Domain.GetProductListUseCase {
    
    let repository: ProductRepository
    
    init(repository: ProductRepository) {
        self.repository = repository
    }
    
    /// Gets all the products
    ///
    /// - Returns: A producer which sends one or more objects
    func get() -> SignalProducer<ProductList, Error> {
        return repository.get()
    }
    
}
