//
//  GetProductListUseCase.swift
//  DubizzleSample
//
//  Created by Sara Awad on 2/20/21.
//

import Foundation
import ReactiveSwift

public protocol GetProductListUseCase {
    func get() -> SignalProducer<ProductList, Swift.Error>
}
