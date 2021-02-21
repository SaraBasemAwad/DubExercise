//
//  ProductDetailsCoordinator.swift
//  DubizzleSample
//
//  Created by Sara Awad on 2/20/21.
//

import Foundation
import ReactiveSwift
import XCGLogger
import Domain

protocol ProductDetailsCoordinatorDelegate: class {
    func productDetailsCoordinatorCompleted(coordinator: ProductDetailsCoordinator)
}

class ProductDetailsCoordinator: Coordinator {
    typealias Delegate = ProductDetailsCoordinatorDelegate
    
    private let presentingViewController: UIViewController
    private let useCaseProvider: Domain.UseCaseProvider
    private weak var delegate: Delegate?

    init(presentingViewController: UIViewController,
         useCaseProvider: Domain.UseCaseProvider,
         delegate: Delegate) {
      self.presentingViewController = presentingViewController
      self.useCaseProvider = useCaseProvider
      self.delegate = delegate
    }
    
    func start(with product: Property<ProductPresentableModel?>) {
        let viewModel = ProductDetailsViewModel(product: product)
        let viewController = ProductDetailsViewController(viewModel: viewModel)
        
        let modalViewModel = ModalContainerViewModel(title: nil, isBackgroundInheritedFromContainer: false)
        let modal = ModalContainerController(with: viewController, on: presentingViewController, viewModel: modalViewModel)
        modal.present()

        viewModel.inputs.dismiss <~ modalViewModel.outputs.onCancel
    }
}
