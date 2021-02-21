//
//  ModalContainerViewModelType.swift
//  DubizzleSample
//
//  Created by Sara Awad on 2/21/21.
//

import Foundation
import ReactiveSwift

protocol ModalContainerViewModelInputs {
  var position: Property<ModalContainerPosition> { get }
  var loading: Action<Bool, Bool, Never> { get }
  var cancel: Action<Void, Void, Never> { get }
}

protocol ModalContainerViewModelOutputs {
  var title: Property<String?> { get }
  var hasTitle: Property<Bool> { get }
  var isLoading: Property<Bool> { get }
  var offset: Property<CGPoint> { get }
  var isBackgroundInheritedFromContainer: Property<Bool> { get }
  var onCancel: Signal<Void, Never> { get }
}

protocol ModalContainerViewModelType {
  var inputs: ModalContainerViewModelInputs { get }
  var outputs: ModalContainerViewModelOutputs { get }
}
