//
//  Environmentable.swift
//  Domain
//
//  Created by Sara Awad on 2/20/21.
//

import Foundation

public protocol Environmentable {
  var name: String { get }
  func url(bundle: Bundle) -> URL
  var currentAppVersion: (version: String?, build: String?) { get }
  static func `default`() -> Self
}
