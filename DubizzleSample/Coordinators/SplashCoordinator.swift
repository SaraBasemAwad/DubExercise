//
//  SplashCoordinator.swift
//  DubizzleSample
//
//  Created by Sara Awad on 2/20/21.
//

import Foundation
import Domain

protocol SplashCoordinatorDelegate: class {
    func splashCoordinatorCompleted(coordinator: SplashCoordinator)
}

class SplashCoordinator: Coordinator {
    typealias Delegate = SplashCoordinatorDelegate
    var window: WindowType
    weak var delegate: Delegate?
    let useCaseProvider: Domain.UseCaseProvider
    
    init(window: WindowType, delegate: Delegate, useCaseProvider: Domain.UseCaseProvider) {
      self.delegate = delegate
      self.window = window
      self.useCaseProvider = useCaseProvider
    }
    
    func start() {
        let viewModel = SplashViewModel()
        viewModel.completed.observeCompleted {
          self.delegate?.splashCoordinatorCompleted(coordinator: self)
        }

        window.rootViewController = SplashViewController(viewModel: viewModel)
    }
}

