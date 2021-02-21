//
//  ProductListProvider.swift
//  DubizzleSample
//
//  Created by Sara Awad on 2/20/21.
//

import Foundation
import ReactiveSwift
import Domain

class ProductListCoordinatorProvider {
  private let useCaseProvider: Domain.UseCaseProvider

  init(useCaseProvider: Domain.UseCaseProvider) {
    self.useCaseProvider = useCaseProvider
  }
    
  func makeProductDetailsCoordinator(presentingViewController: UIViewController,
                                    delegate: ProductDetailsCoordinator.Delegate) -> ProductDetailsCoordinator {
    return ProductDetailsCoordinator(presentingViewController: presentingViewController,
                                     useCaseProvider: useCaseProvider,
                                     delegate: delegate)
  }
}
