//
//  ProductService.swift
//  DubizzleSample
//
//  Created by Sara Awad on 2/20/21.
//

import Foundation
import Moya

enum ProductService {
    case get
}

extension ProductService: ExpectedErrorable {
  func expectedError(named name: String) -> ExpectedError? {
    switch self {
    case .get: return nil
    }
  }
}

extension ProductService: TargetType {
    var baseURL: URL { return Environment.environment.url() }
    
    var path: String {
        switch self {
        case .get:    return "/default/dynamodb-writer"
      }
    }
    
    var method: Moya.Method {
        switch self {
        case .get: return .get
        }
    }
    
    var task: Task {
        switch self {
        case .get: return .requestPlain
        }
    }
    
    var headers: [String: String]? {
      return [
        "Accept": "application/json",
        "Content-type": "application/json"
      ]
    }
    
    var sampleData: Data {
        switch self {
        case .get: return sampleData(from: ProductListResponse.sample)
        }
    }
}
