//
//  ProductListConverterSpecs.swift
//  PlatformTests
//
//  Created by Sara Awad on 2/21/21.
//

import Quick
import Nimble

@testable import Platform

class ProductListConverterSpecs: QuickSpec {
    override func spec() {
        var sut: ProductListConverter!
        var expectedResponse: ProductListResponse!
        
        beforeEach {
            sut = ProductListConverter()
            let expectedProductResponse = ProductListResponse.ProductResponse(uid: "4878bf592579410fba52941d00b62f94",
                                                                              created_at: "2019-02-24 04:04:17.566515",
                                                                              name: "Notebook",
                                                                              price: "AED 5",
                                                                              image_ids: ["9355183956e3445e89735d877b798689"],
                                                                              image_urls: ["https://demo-app-photos-45687895456123.s3.amazonaws.com/9355183956e3445e89735d877b798689?AWSAccessKeyId=ASIASV3YI6A4XEWPEBO3&Signature=BIlll5Q1gb12UZdOEFhbwOL9vVE%3D&x-amz-security-token=IQoJb3JpZ2luX2VjEJj%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLWVhc3QtMSJHMEUCIHZ7sZaH%2Fx0Za0URIemGJpht9wPpyVxaF%2FsPsS4ImF32AiEAh3Elz4bNKbRYTJP95trNV9CddNENemAIt%2B6Nr8WHH6sq1wEIof%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARACGgwxODQzOTg5NjY4NDEiDAGKSu4mPjJRLd2EeyqrAYVMeatZSW%2Fz2iTET8n8x4Fn4DbZYBoPKqkHpyHoYNP7aRJYMfL1cKePdyDdcwZ%2FGNUROZ52W8GwK4%2Fvm8nJAx6Q4N%2BuTI4Qk6T0V8QbgXMTzgU9Tpt%2BfRFF6ZhrMx%2BLixcwiibDYRjqrJET64OflYpUPRmDckmZwuWIJuic%2BJnPe%2FD1McrUOudVV%2B6yqvfhisLqTNU%2BM6ukMnXpRM6brCG8zjkewQDBQsG6ETDT8sKBBjrgAYIM0RE76Bri25gykkCAe3Dlpkoo1o6ugF0RbPHh%2FlcK5V0UGtNlqlhck0ureCCfFipAAHUInZGj711DTUtzzqjLLPv2IzFg5jVzrz3uO9sLq5oqO6eAwPR0%2FV%2B9kGPjXqvZJG6aHYmIxmS4jC5LjtWNRrit0Xyq2YfY77%2FKW4qdslls3w9rSvsaw0cPqSZ5Q1MV1OfCkKy8EZv%2FnZLl7gS9slD03P5eDnyWePnYuB78Vt4%2BO3t0NWP9gJ4ZwfijMLcEzyNmxNTTWDTly6hjVCi6qgGpFHkodZ5f7lOOUE2J&Expires=1613812024"],
                                                                              image_urls_thumbnails: ["https://demo-app-photos-45687895456123.s3.amazonaws.com/9355183956e3445e89735d877b798689-thumbnail?AWSAccessKeyId=ASIASV3YI6A4XEWPEBO3&Signature=DS6An%2FdUZf2AxqIDJiUXF%2Bqouzo%3D&x-amz-security-token=IQoJb3JpZ2luX2VjEJj%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLWVhc3QtMSJHMEUCIHZ7sZaH%2Fx0Za0URIemGJpht9wPpyVxaF%2FsPsS4ImF32AiEAh3Elz4bNKbRYTJP95trNV9CddNENemAIt%2B6Nr8WHH6sq1wEIof%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARACGgwxODQzOTg5NjY4NDEiDAGKSu4mPjJRLd2EeyqrAYVMeatZSW%2Fz2iTET8n8x4Fn4DbZYBoPKqkHpyHoYNP7aRJYMfL1cKePdyDdcwZ%2FGNUROZ52W8GwK4%2Fvm8nJAx6Q4N%2BuTI4Qk6T0V8QbgXMTzgU9Tpt%2BfRFF6ZhrMx%2BLixcwiibDYRjqrJET64OflYpUPRmDckmZwuWIJuic%2BJnPe%2FD1McrUOudVV%2B6yqvfhisLqTNU%2BM6ukMnXpRM6brCG8zjkewQDBQsG6ETDT8sKBBjrgAYIM0RE76Bri25gykkCAe3Dlpkoo1o6ugF0RbPHh%2FlcK5V0UGtNlqlhck0ureCCfFipAAHUInZGj711DTUtzzqjLLPv2IzFg5jVzrz3uO9sLq5oqO6eAwPR0%2FV%2B9kGPjXqvZJG6aHYmIxmS4jC5LjtWNRrit0Xyq2YfY77%2FKW4qdslls3w9rSvsaw0cPqSZ5Q1MV1OfCkKy8EZv%2FnZLl7gS9slD03P5eDnyWePnYuB78Vt4%2BO3t0NWP9gJ4ZwfijMLcEzyNmxNTTWDTly6hjVCi6qgGpFHkodZ5f7lOOUE2J&Expires=1613812024"])
            expectedResponse = ProductListResponse(results: [expectedProductResponse])
        }
        
        describe("from product list response") {
            it("returns a valid product") {
                let productList = sut.from(expectedResponse)
                let firstProduct = productList.products[0]
                let firstProductResponse = expectedResponse.results[0]
                expect(productList.products.count) == expectedResponse.results.count
                expect(firstProduct.name) == firstProductResponse.name
                expect(firstProduct.price) == firstProductResponse.price
                expect(firstProduct.createdAt) == firstProductResponse.created_at
                expect(firstProduct.imageUrls.count) == firstProductResponse.image_urls.count
                expect(firstProduct.imageUrls[0]) == firstProductResponse.image_urls[0]
            }
        }
        
    }
}
