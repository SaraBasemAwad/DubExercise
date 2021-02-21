// MARK: - Mocks generated from file: Platform/Converters/ProductListConverter.swift at 2021-02-21 16:23:17 +0000

//
//  ProductListConverter.swift
//  DubizzleSample
//
//  Created by Sara Awad on 2/20/21.
//

import Cuckoo
@testable import Platform

import Domain
import Foundation


 class MockProductListConverter: ProductListConverter, Cuckoo.ClassMock {
    
     typealias MocksType = ProductListConverter
    
     typealias Stubbing = __StubbingProxy_ProductListConverter
     typealias Verification = __VerificationProxy_ProductListConverter

     let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: true)

    
    private var __defaultImplStub: ProductListConverter?

     func enableDefaultImplementation(_ stub: ProductListConverter) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }
    

    

    

    
    
    
     override func from(_ response: ProductListResponse) -> ProductList {
        
    return cuckoo_manager.call("from(_: ProductListResponse) -> ProductList",
            parameters: (response),
            escapingParameters: (response),
            superclassCall:
                
                super.from(response)
                ,
            defaultCall: __defaultImplStub!.from(response))
        
    }
    

	 struct __StubbingProxy_ProductListConverter: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	     init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    
	    func from<M1: Cuckoo.Matchable>(_ response: M1) -> Cuckoo.ClassStubFunction<(ProductListResponse), ProductList> where M1.MatchedType == ProductListResponse {
	        let matchers: [Cuckoo.ParameterMatcher<(ProductListResponse)>] = [wrap(matchable: response) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockProductListConverter.self, method: "from(_: ProductListResponse) -> ProductList", parameterMatchers: matchers))
	    }
	    
	}

	 struct __VerificationProxy_ProductListConverter: Cuckoo.VerificationProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	    private let callMatcher: Cuckoo.CallMatcher
	    private let sourceLocation: Cuckoo.SourceLocation
	
	     init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
	        self.cuckoo_manager = manager
	        self.callMatcher = callMatcher
	        self.sourceLocation = sourceLocation
	    }
	
	    
	
	    
	    @discardableResult
	    func from<M1: Cuckoo.Matchable>(_ response: M1) -> Cuckoo.__DoNotUse<(ProductListResponse), ProductList> where M1.MatchedType == ProductListResponse {
	        let matchers: [Cuckoo.ParameterMatcher<(ProductListResponse)>] = [wrap(matchable: response) { $0 }]
	        return cuckoo_manager.verify("from(_: ProductListResponse) -> ProductList", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	}
}

 class ProductListConverterStub: ProductListConverter {
    

    

    
     override func from(_ response: ProductListResponse) -> ProductList  {
        return DefaultValueRegistry.defaultValue(for: (ProductList).self)
    }
    
}

