//
//  ProductListConverter.swift
//  DubizzleSample
//
//  Created by Sara Awad on 2/20/21.
//

import Foundation
import Domain

class ProductListConverter {
    func from(_ response: ProductListResponse) -> ProductList {
        return ProductList(products: response.results.map(from))
    }
}

private extension ProductListConverter {
    func from(_ response: ProductListResponse.ProductResponse) -> Product {
        return Product(uid: response.uid,
                       createdAt: response.created_at,
                       name: response.name,
                       price: response.price,
                       imageIds: response.image_ids,
                       imageUrls: response.image_urls,
                       imageUrlsThumbnails: response.image_urls_thumbnails)
    }
}
