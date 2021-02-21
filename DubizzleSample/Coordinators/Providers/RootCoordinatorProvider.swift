//
//  RootCoordinatorProvider.swift
//  DubizzleSample
//
//  Created by Sara Awad on 2/20/21.
//

import Foundation
import XCGLogger
import Platform
import Domain

typealias UseCaseProviderType = Domain.UseCaseProvider

class RootCoordinatorProvider {
    private(set) var useCaseProvider: UseCaseProviderType
    let logger: XCGLogger?

    init(useCaseProvider: Domain.UseCaseProvider, logger: XCGLogger? = nil) {
      self.useCaseProvider = useCaseProvider
      self.logger = logger
    }
    
    func makeProductCoordinator(window: WindowType,
                                delegate: ProductListCoordinator.Delegate) -> ProductListCoordinator {
        return ProductListCoordinator(window: window,
                                      delegate: delegate,
                                      useCaseProvider: useCaseProvider)
    }
    
    func makeSplashCoordinator(window: WindowType, delegate: SplashCoordinator.Delegate) -> SplashCoordinator {
      return SplashCoordinator(window: window,
                               delegate: delegate,
                               useCaseProvider: useCaseProvider)
    }
}
