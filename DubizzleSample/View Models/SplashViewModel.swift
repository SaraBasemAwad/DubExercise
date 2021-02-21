//
//  SplashViewModel.swift
//  DubizzleSample
//
//  Created by Sara Awad on 2/20/21.
//

import Foundation
import ReactiveSwift
import Domain
import Platform

class SplashViewModel: SplashViewModelType, SplashViewModelInputs, SplashViewModelOutputs {
  let completed: Signal<Void, Never>
  let complete: Action<Void, Void, Never>
  let appVersion: Property<(version: String?, build: String?)>
  let currentYear: Property<Int>
    
  var inputs: SplashViewModelInputs { return self }
  var outputs: SplashViewModelOutputs { return self }

  init() {
    complete = Action { _ in
      return SignalProducer.empty
    }

    completed = complete.completed.take(first: 1)
    appVersion = Property(value: (version: "1.1",
                                  build: "1"))

    let gregorian = Calendar(identifier: .gregorian)
    currentYear = Property(value: gregorian.component(.year, from: Date()))
  }
}
