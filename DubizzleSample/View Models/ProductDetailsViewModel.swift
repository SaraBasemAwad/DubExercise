//
//  ProductDetailsViewModel.swift
//  DubizzleSample
//
//  Created by Sara Awad on 2/21/21.
//

import Foundation
import ReactiveSwift

class ProductDetailsViewModel: ProductDetailsViewModelType, ProductDetailsViewModelInputs, ProductDetailsViewModelOutputs {
    let dismiss: Action<Void, Never, Never>
    let product: Property<ProductPresentableModel?>
    
    var cancel: Action<Void, Void, Never>
    var onCancel: Signal<Void, Never>

    var inputs: ProductDetailsViewModelInputs { return self }
    var outputs: ProductDetailsViewModelOutputs { return self }
    
    init(product: Property<ProductPresentableModel?>) {
        self.product = product
        dismiss = Action { SignalProducer.empty }
        
        cancel = Action { SignalProducer.empty }
        onCancel = cancel.completed
    }
}
