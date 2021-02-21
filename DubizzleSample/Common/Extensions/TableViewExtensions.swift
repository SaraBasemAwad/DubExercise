//
//  CollectionViewExtensions.swift
//  DubizzleSample
//
//  Created by Sara Awad on 2/20/21.
//

import Foundation
import ReactiveSwift

protocol Cell {
    static func nibName() -> String
    static func nib() -> UINib
    static func identifier() -> String
}

extension Cell {
    static func identifier() -> String {
      return "\(nibName())Identifier"
    }

    static func nib() -> UINib {
      return UINib(nibName: nibName(), bundle: nil)
    }

    static func nibName() -> String {
        return String(describing: self)
    }
}

extension UITableView {
  func register<T: UITableViewCell & Cell>(cell: T.Type) {
    register(cell.nib(), forCellReuseIdentifier: cell.identifier())
  }

  func dequeueReusable<T: UITableViewCell & Cell>(cell: T.Type, indexPath: IndexPath) -> T {
    guard let cell = dequeueReusableCell(withIdentifier: cell.identifier(), for: indexPath) as? T else {
      fatalError("Unable to cast cell to desired type")
    }

    return cell
  }
}

