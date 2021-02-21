//
//  ProductDetailsViewModelType.swift
//  DubizzleSample
//
//  Created by Sara Awad on 2/21/21.
//

import ReactiveSwift

protocol ProductDetailsViewModelInputs {
   var dismiss: Action<Void, Never, Never> { get }
    var cancel: Action<Void, Void, Never> { get }
}

protocol ProductDetailsViewModelOutputs {
    var product: Property<ProductPresentableModel?> { get }
    var onCancel: Signal<Void, Never> { get }
}

protocol ProductDetailsViewModelType {
  var inputs: ProductDetailsViewModelInputs { get }
  var outputs: ProductDetailsViewModelOutputs { get }
}
