//
//  ProductListViewModelType.swift
//  DubizzleSample
//
//  Created by Sara Awad on 2/20/21.
//

import Foundation
import ReactiveSwift
import Domain

protocol ProductListViewModelInputs {
    var load: Action<Void, Domain.ProductList, Swift.Error> { get }
    var selectProduct: Action<ProductPresentableModel, ProductPresentableModel, Never> { get }
}

protocol ProductListViewModelOutputs {
    var products: Property<[ProductPresentableModel]> { get }
    var isLoading: Property<Bool> { get }
    var errors: Signal<Swift.Error, Never> { get }
    var loadCompleted: Signal<Void, Never> { get }
    var selectedProduct: Property<ProductPresentableModel?> { get }
}

protocol ProductListViewModelType {
    var inputs: ProductListViewModelInputs { get }
    var outputs: ProductListViewModelOutputs { get }
}
