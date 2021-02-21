//
//  ProductListViewModel.swift
//  DubizzleSample
//
//  Created by Sara Awad on 2/20/21.
//

import Foundation
import ReactiveSwift
import Domain

class ProductListViewModel: ProductListViewModelType, ProductListViewModelInputs, ProductListViewModelOutputs {
    
    let load: Action<Void, Domain.ProductList, Error>
    let selectProduct: Action<ProductPresentableModel, ProductPresentableModel, Never>
    let products: Property<[ProductPresentableModel]>
    let isLoading: Property<Bool>
    let errors: Signal<Swift.Error, Never>
    let loadCompleted: Signal<Void, Never>
    let selectedProduct: Property<ProductPresentableModel?>
    private let mutableProducts: MutableProperty<Domain.ProductList> = MutableProperty(Domain.ProductList(products: []))
    private let mutableSelectedProduct = MutableProperty<ProductPresentableModel?>(nil)
    
    var inputs: ProductListViewModelInputs { return self }
    var outputs: ProductListViewModelOutputs { return self }
    
    init(useCase: Domain.GetProductListUseCase) {
        load = Action { useCase.get() }
        mutableProducts <~ load.values
        products = Property(initial: [], then: mutableProducts.map(ProductListViewModel.toPresentableModels).signal)
        isLoading = load.isExecuting
        errors = load.errors
        loadCompleted = load.completed
        
        selectProduct = Action { SignalProducer(value: $0) }
        
//        selectedProduct <~ selectProduct.values
        mutableSelectedProduct <~ selectProduct.values
        selectedProduct = Property(mutableSelectedProduct)
    }
    
    private static func toPresentableModels(from productList: Domain.ProductList) -> [ProductPresentableModel] {
        func convert(from product: Domain.Product) -> ProductPresentableModel {
            if let imageURL = URL(string: product.imageUrls.first ?? product.imageUrlsThumbnails.first ?? "") {
                return ProductPresentableModel(name: product.name,
                                               price: ProductListViewModel.formatCurrency(from: product.price),
                                               imageURL: imageURL)
            }
            return ProductPresentableModel(name: product.name,
                                           price: ProductListViewModel.formatCurrency(from: product.price),
                                           imageURL: URL.init(string: ""))
            
        }
        return productList.products.map(convert)
    }
    
    private static func formatCurrency(from productPrice: String) -> String {
        let currencyFormatter: NumberFormatter = {
          let formatter = NumberFormatter()
          formatter.usesGroupingSeparator = true
          formatter.numberStyle = .currencyAccounting
          formatter.currencySymbol = "AED"
          return formatter
        }()
        
        let priceWithCurrency = productPrice.components(separatedBy: " ")
        guard let priceFormatted = currencyFormatter.string(from: NSNumber(value: Int( priceWithCurrency[1]) ?? 0)) else {
            return productPrice
        }
        return priceFormatted
    }
}
