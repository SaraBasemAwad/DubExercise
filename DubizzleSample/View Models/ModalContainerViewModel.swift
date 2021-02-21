//
//  ModalContainerViewModel.swift
//  DubizzleSample
//
//  Created by Sara Awad on 2/21/21.
//

import Foundation
import ReactiveSwift

enum ModalContainerPosition {
  case center
  case offset(CGFloat, CGFloat)
}

class ModalContainerViewModel: ModalContainerViewModelType, ModalContainerViewModelInputs, ModalContainerViewModelOutputs {
  let position: Property<ModalContainerPosition>
  let loading: Action<Bool, Bool, Never>
  let cancel: Action<Void, Void, Never>

  let title: Property<String?>
  let hasTitle: Property<Bool>
  let isLoading: Property<Bool>
  let offset: Property<CGPoint>
  let isBackgroundInheritedFromContainer: Property<Bool>
  let onCancel: Signal<Void, Never>

  var inputs: ModalContainerViewModelInputs { return self }
  var outputs: ModalContainerViewModelOutputs { return self }

  init(title: String?, position: ModalContainerPosition = .center, isBackgroundInheritedFromContainer: Bool = true) {
    self.title = Property(value: title)
    self.position = Property(value: position)
    self.isBackgroundInheritedFromContainer = Property(value: isBackgroundInheritedFromContainer)

    hasTitle = self.title.map { $0?.isEmpty == false }

    loading = Action { SignalProducer(value: $0) }
    isLoading = Property(initial: false, then: loading.values)

    offset = ModalContainerViewModel.offset(with: position)

    cancel = Action { SignalProducer.empty }
    onCancel = cancel.completed
  }
}

private extension ModalContainerViewModel {
  class func offset(with position: ModalContainerPosition) -> Property<CGPoint> {
    var offset: CGPoint

    switch position {
    case .center:
      offset = CGPoint.zero
    case .offset(let xOffset, let yOffset):
      offset = CGPoint(x: xOffset, y: yOffset)
    }

    return Property(value: offset)
  }
}
