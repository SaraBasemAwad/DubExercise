//
//  UseCaseProvider.swift
//  DubizzleSample
//
//  Created by Sara Awad on 2/20/21.
//

import Foundation

public protocol UseCaseProvider {
    func makeGetProductListUseCase() -> GetProductListUseCase
}
