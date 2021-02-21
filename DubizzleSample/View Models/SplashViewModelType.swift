//
//  SplashViewModelType.swift
//  DubizzleSample
//
//  Created by Sara Awad on 2/21/21.
//

import Foundation
import ReactiveSwift
import Domain

protocol SplashViewModelInputs {
    var complete: Action<Void, Void, Never> { get }
    var appVersion: Property<(version: String?, build: String?)> { get }
    var currentYear: Property<Int> { get }
}

protocol SplashViewModelOutputs {
    var completed: Signal<Void, Never> { get }
}

protocol SplashViewModelType {
    var inputs: SplashViewModelInputs { get }
    var outputs: SplashViewModelOutputs { get }
}

