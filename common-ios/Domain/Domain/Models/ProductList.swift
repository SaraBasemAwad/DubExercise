//
//  ProductList.swift
//  DubizzleSample
//
//  Created by Sara Awad on 2/20/21.
//

import Foundation

public struct ProductList {
    public let products: [Product]
    
    public init(products: [Product]) {
        self.products = products
    }
}

public struct Product {
    public let uid: String
    public let createdAt: String
    public let name: String
    public let price: String
    public let imageIds: [String]
    public let imageUrls: [String]
    public let imageUrlsThumbnails: [String]
    
    public init(uid: String,
                createdAt: String,
                name: String,
                price: String,
                imageIds: [String],
                imageUrls: [String],
                imageUrlsThumbnails: [String]) {
      self.uid = uid
      self.createdAt = createdAt
      self.name = name
      self.price = price
      self.imageIds = imageIds
      self.imageUrls = imageUrls
      self.imageUrlsThumbnails = imageUrlsThumbnails
    }
}
