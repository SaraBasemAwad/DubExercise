//
//  ImageViewExtensions.swift
//  DubizzleSample
//
//  Created by Sara Awad on 2/21/21.
//

import UIKit
import ReactiveSwift

extension Reactive where Base: UIImageView {
  public var imageUrl: BindingTarget<URL?> {
    return makeBindingTarget { $0.sd_setImage(with: $1) }
  }

  public func imageUrl(with placeholder: UIImage?) -> BindingTarget<URL?> {
    return makeBindingTarget { $0.sd_setImage(with: $1, placeholderImage: placeholder) }
  }
}
