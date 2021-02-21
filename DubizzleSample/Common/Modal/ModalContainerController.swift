//
//  ModalContainerController.swift
//  DubizzleSample
//
//  Created by Sara Awad on 2/21/21.
//

import UIKit

class ModalContainerController {
  private let viewController: UIViewController
  private let presenter: UIViewController
  private let viewModel: ModalContainerViewModel

  init(with viewController: UIViewController, on presenter: UIViewController, viewModel: ModalContainerViewModel) {
    self.viewController = viewController
    self.presenter = presenter
    self.viewModel = viewModel
  }

  func present() {
    let modalViewController = ModalContainerViewController(with: viewController, viewModel: viewModel)
    modalViewController.modalPresentationStyle = .overFullScreen
    modalViewController.modalTransitionStyle = .crossDissolve

    presenter.present(modalViewController, animated: true)
  }
}
