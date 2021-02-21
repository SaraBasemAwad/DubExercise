//
//  GeneratedMocks.swift
//  DubizzleSampleTests
//
//  Created by Sara Awad on 2/21/21.
//

import Cuckoo
@testable import DubizzleSample

import Foundation
import ReactiveSwift

class MockGetProductListViewModel: DubizzleSample.ProductListViewModel, Cuckoo.ClassMock {
    typealias MocksType = DubizzleSample.ProductListViewModel
    
    typealias Stubbing = __StubbingProxy_ProductListViewModel
    
    typealias Verification = _VerificationProxy_ProductListViewModel
    
    var cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: true)
    
    private var __defaultImplStub: DubizzleSample.ProductListViewModel?

     func enableDefaultImplementation(_ stub: DubizzleSample.ProductListViewModel) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }
    
    override var inputs: ProductListViewModelInputs {
       get {
           return cuckoo_manager.getter("inputs",
               superclassCall:
                   
                   super.inputs
                   ,
               defaultCall: __defaultImplStub!.inputs)
       }
   }
   
    override var outputs: ProductListViewModelOutputs {
       get {
           return cuckoo_manager.getter("outputs",
               superclassCall:
                   
                   super.outputs
                   ,
               defaultCall: __defaultImplStub!.outputs)
       }
   }
   
    struct __StubbingProxy_ProductListViewModel: Cuckoo.StubbingProxy {
       private let cuckoo_manager: Cuckoo.MockManager
   
        init(manager: Cuckoo.MockManager) {
           self.cuckoo_manager = manager
       }
       
       
       var inputs: Cuckoo.ClassToBeStubbedReadOnlyProperty<MockGetProductListViewModel, ProductListViewModelInputs> {
           return .init(manager: cuckoo_manager, name: "inputs")
       }
       
       
       var outputs: Cuckoo.ClassToBeStubbedReadOnlyProperty<MockGetProductListViewModel, ProductListViewModelOutputs> {
           return .init(manager: cuckoo_manager, name: "outputs")
       }
   }
    
    struct _VerificationProxy_ProductListViewModel: Cuckoo.VerificationProxy {
       private let cuckoo_manager: Cuckoo.MockManager
       private let callMatcher: Cuckoo.CallMatcher
       private let sourceLocation: Cuckoo.SourceLocation
   
        init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
           self.cuckoo_manager = manager
           self.callMatcher = callMatcher
           self.sourceLocation = sourceLocation
       }
   
       
       
       var inputs: Cuckoo.VerifyReadOnlyProperty<ProductListViewModelInputs> {
           return .init(manager: cuckoo_manager, name: "inputs", callMatcher: callMatcher, sourceLocation: sourceLocation)
       }
       
       
       var outputs: Cuckoo.VerifyReadOnlyProperty<ProductListViewModelOutputs> {
           return .init(manager: cuckoo_manager, name: "outputs", callMatcher: callMatcher, sourceLocation: sourceLocation)
       }
   }
}

