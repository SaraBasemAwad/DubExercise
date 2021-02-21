//
//  ProductListCoordinator.swift
//  DubizzleSample
//
//  Created by Sara Awad on 2/20/21.
//

import Foundation
import ReactiveSwift
import ReactiveCocoa
import XCGLogger
import Domain

protocol ProductListCoordinatorDelegate: class {
    func productListCoordinatorDelegateCompleted(coordinator: ProductListCoordinator)
}

class ProductListCoordinator: Coordinator {
    typealias Delegate = ProductListCoordinatorDelegate
    
    private var window: WindowType
    private weak var delegate: Delegate?
    private let useCaseProvider: Domain.UseCaseProvider
    private var rootViewController: ProductListViewController?
    private var viewModel: ProductListViewModel!
    private let logger: XCGLogger?
    
    init(window: WindowType,
         delegate: Delegate,
         useCaseProvider: Domain.UseCaseProvider,
         logger: XCGLogger? = nil) {
        self.window = window
        self.delegate = delegate
        self.useCaseProvider = useCaseProvider
        self.logger = logger
    }
    
    func start() {
        viewModel = ProductListViewModel(useCase: useCaseProvider.makeGetProductListUseCase())
        let viewController = ProductListViewController(viewModel: viewModel)
       
        window.rootViewController = viewController
        rootViewController = viewController
        window.transitionTo(viewController, transition: .animated(options: .curveEaseIn, duration: 1.0))
        
        reactive.onSelectedProduct <~ viewModel.outputs.selectedProduct.signal.skipNil().map(value: ())
    }
    
    func toDetails() {
        guard let presentingViewController = rootViewController, let viewModel = viewModel else {
          return
        }
        let provider = ProductListCoordinatorProvider(useCaseProvider: useCaseProvider)
        let coordinator = provider.makeProductDetailsCoordinator(presentingViewController: presentingViewController, delegate: self)
        coordinator.start(with: viewModel.outputs.selectedProduct)
        childStarted(coordinator: coordinator)
    }
}

extension ProductListCoordinator: ProductDetailsCoordinator.Delegate {
    func productDetailsCoordinatorCompleted(coordinator: ProductDetailsCoordinator) {
        viewModel.inputs.load.apply().start()
        childCompleted(coordinator: coordinator)
    }
}

extension ProductListCoordinator: ReactiveExtensionsProvider {}
private extension Reactive where Base: ProductListCoordinator {
    var onSelectedProduct: BindingTarget<Void> {
        return makeBindingTarget { base, _ in base.toDetails() }
    }
}

