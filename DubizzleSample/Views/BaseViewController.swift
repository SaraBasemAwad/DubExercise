//
//  BaseViewController.swift
//  DubizzleSample
//
//  Created by Sara Awad on 2/20/21.
//

import UIKit
import ReactiveSwift
import ReactiveCocoa

class BaseViewController: UIViewController {
    private let mutableIsVisible = MutableProperty(false)

    var isVisible: Property<Bool> {
      return Property(mutableIsVisible)
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
      super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)

      let willAppear = reactive.trigger(for: #selector(viewWillAppear(_:))).map(value: true)
      let willDisappear = reactive.trigger(for: #selector(viewWillDisappear(_:))).map(value: false)
      mutableIsVisible <~ Signal.merge(willAppear, willDisappear)
    }
    
    required init?(coder aDecoder: NSCoder) {
      fatalError("Do not initialize from storyboard")
    }

    override func viewDidLoad() {
      super.viewDidLoad()
    }

    override func viewDidAppear(_ animated: Bool) {
      super.viewDidAppear(animated)
    }
}
