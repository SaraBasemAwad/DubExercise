//
//  RootCoordinator.swift
//  DubizzleSample
//
//  Created by Sara Awad on 2/20/21.
//

import Foundation
import XCGLogger
import Platform
import Domain

class RootCoordinator: Coordinator, ProductListCoordinatorDelegate {
    func productListCoordinatorDelegateCompleted(coordinator: ProductListCoordinator) {
    }
    
    
    let window: WindowType
    let provider: RootCoordinatorProvider
    
    init(window: WindowType, provider: RootCoordinatorProvider? = nil, logger: XCGLogger? = nil) {
      self.window = window
      self.provider = provider ?? RootCoordinator.defaultProvider(with: logger)
    }
    
    func start() {
        toSplash()
    }
}

private extension RootCoordinator {
    func toSplash() {
        let coordinator = provider.makeSplashCoordinator(window: window, delegate: self)
        coordinator.start()
        childStarted(coordinator: coordinator)
    }
    
    func toProduct() {
        let coordinator = provider.makeProductCoordinator(window: window, delegate: self)
        coordinator.start()
        childStarted(coordinator: coordinator)
    }
    
    static func defaultProvider(with logger: XCGLogger?) -> RootCoordinatorProvider {
        let useCaseProvider = Platform.UseCaseProvider(logger: logger)
        return RootCoordinatorProvider(useCaseProvider: useCaseProvider, logger: logger)
    }
}

extension RootCoordinator: SplashCoordinator.Delegate {
    func splashCoordinatorCompleted(coordinator: SplashCoordinator) {
        childCompleted(coordinator: coordinator)
        toProduct()
    }
}
