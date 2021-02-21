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

protocol SplashViewModelType {
  var complete: Action<Void, Void, Never> { get }
  var appVersion: Property<(version: String?, build: String?)> { get }
  var currentYear: Property<Int> { get }
}

class SplashViewModel: SplashViewModelType {
  let completed: Signal<Void, Never>
  let complete: Action<Void, Void, Never>
  let appVersion: Property<(version: String?, build: String?)>
  let currentYear: Property<Int>

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
