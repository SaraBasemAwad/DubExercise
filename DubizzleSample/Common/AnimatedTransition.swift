//
//  AnimatedTransition.swift
//  DubizzleSample
//
//  Created by Sara Awad on 2/20/21.
//

import UIKit

enum AnimatedTransition {
  static func transitionWith(options: UIView.AnimationOptions = .transitionCurlUp,
                             duration: TimeInterval = 1.0) -> CATransition {
    let animatedTransition = transition(from: options)
    animatedTransition.duration = duration
    animatedTransition.fillMode = CAMediaTimingFillMode.forwards

    return animatedTransition
  }
}

private extension AnimatedTransition {
  enum AnimatedTransitionType {
    case pageCurl, pageUnCurl, flip, fade, push

    var rawValue: String {
      switch self {
      case .pageCurl:   return "pageCurl"
      case .pageUnCurl: return "pageUnCurl"
      case .flip:       return "flip"
      case .fade:       return CATransitionType.fade.rawValue
      case .push:       return CATransitionType.push.rawValue
      }
    }
  }

  static func transition(from animationOptions: UIView.AnimationOptions) -> CATransition {
    let type = transitionType(from: animationOptions)
    let subtype = transitionDirectionFromOrientation()
    let functionName = timingFunctionName(from: animationOptions)

    let transition = CATransition()
    transition.timingFunction = CAMediaTimingFunction(name: functionName)
    transition.type = CATransitionType(rawValue: type.rawValue)
    transition.subtype = subtype

    return transition
  }

  static func transitionType(from animationOptions: UIView.AnimationOptions) -> AnimatedTransitionType {
    switch transitionOption(from: animationOptions) {
    case .transitionCurlUp:
      return .pageCurl
    case .transitionCurlDown:
      return .pageUnCurl
    case .transitionFlipFromTop,
         .transitionFlipFromBottom,
         .transitionFlipFromLeft,
         .transitionFlipFromRight:
      return .flip
    case .transitionCrossDissolve:
      return .fade
    default:
      return .push
    }
  }

  static func transitionOption(from animationOptions: UIView.AnimationOptions) -> UIView.AnimationOptions {
    return extractRegion(from: animationOptions, shiftBy: 20, capBy: 7)
  }

  static func transitionDirectionFromOrientation() -> CATransitionSubtype? {
    switch UIApplication.shared.statusBarOrientation {
    case .portrait, .portraitUpsideDown:  return CATransitionSubtype.fromTop
    case .landscapeLeft:                  return CATransitionSubtype.fromRight
    case .landscapeRight:                 return CATransitionSubtype.fromLeft
    default:                              return nil
    }
  }

  static func timingFunctionName(from animationOptions: UIView.AnimationOptions) -> CAMediaTimingFunctionName {
    switch curveOption(from: animationOptions) {
    case .curveEaseIn:    return CAMediaTimingFunctionName.easeIn
    case .curveEaseInOut: return CAMediaTimingFunctionName.easeInEaseOut
    case .curveEaseOut:   return CAMediaTimingFunctionName.easeOut
    case .curveLinear:    return CAMediaTimingFunctionName.linear
    default:              return CAMediaTimingFunctionName.linear
    }
  }

  static func curveOption(from animationOptions: UIView.AnimationOptions) -> UIView.AnimationOptions {
    return extractRegion(from: animationOptions, shiftBy: 16, capBy: 3)
  }

  static func extractRegion(from animationOptions: UIView.AnimationOptions,
                            shiftBy: UInt,
                            capBy: UInt) -> UIView.AnimationOptions {
    let rawValue = ((UInt(animationOptions.rawValue) >> shiftBy) & capBy) << shiftBy
    return UIView.AnimationOptions(rawValue: rawValue)
  }
}

