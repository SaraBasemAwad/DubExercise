//
//  WindowType.swift
//  DubizzleSample
//
//  Created by Sara Awad on 2/20/21.
//

import Foundation
import UIKit

protocol WindowType: class {
  var rootViewController: UIViewController? { get set }

  func transitionTo(_ rootViewController: UIViewController, transition: WindowTransition)
}

enum WindowTransition {
  case immediate
  case animated(options: UIView.AnimationOptions, duration: TimeInterval)
}

extension WindowType {
  func transitionTo(_ rootViewController: UIViewController, transition: WindowTransition) {
    return self.transitionTo(rootViewController, transition: transition)
  }
}

extension UIWindow: WindowType {
    func transitionTo(_ rootViewController: UIViewController, transition: WindowTransition) {
    defer {
      self.rootViewController = rootViewController
      makeKeyAndVisible()
    }

    switch transition {
    case .immediate: return
    case .animated(let options, let duration):
      let layerTransition = AnimatedTransition.transitionWith(options: options, duration: duration)
      layer.add(layerTransition, forKey: kCATransition)
    }
  }
}
