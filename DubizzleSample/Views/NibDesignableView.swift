//
//  NibDesignableView.swift
//  DubizzleSample
//
//  Created by Sara Awad on 2/20/21.
//

import UIKit

@IBDesignable
class NibDesignableView: UIView {
  private lazy var contentView: UIView = {
    let thisType = type(of: self)
    let nibName = String(describing: thisType)
    let nib = UINib(nibName: nibName, bundle: nil)
    let allViews = nib.instantiate(withOwner: self, options: nil)
    guard let view = allViews.first as? UIView, allViews.count == 1 else {
      preconditionFailure("Nib must contain exactly one view")
    }

    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()

  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    configureContentView()
  }

  override init(frame: CGRect) {
    super.init(frame: frame)
    configureContentView()
  }
}

private extension NibDesignableView {
  func configureContentView() {
    insertSubview(contentView, at: 0)

    let bindings = ["contentView": contentView]
    let constraints = ["H:|-0-[contentView]-0-|", "V:|-0-[contentView]-0-|"].flatMap {
      NSLayoutConstraint.constraints(withVisualFormat: $0, options: [], metrics: nil, views: bindings)
    }
    addConstraints(constraints)
    setNeedsUpdateConstraints()
  }
}
