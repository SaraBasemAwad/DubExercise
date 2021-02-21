//
//  ModalContainerViewController.swift
//  DubizzleSample
//
//  Created by Sara Awad on 2/21/21.
//

import UIKit
import ReactiveSwift
import ReactiveCocoa

class ModalContainerViewController: BaseViewController {
  @IBOutlet var stackView: UIStackView!

  private var viewController: UIViewController
  private var viewModel: ModalContainerViewModel

  init(with viewController: UIViewController,
       viewModel: ModalContainerViewModel) {
    self.viewController = viewController
    self.viewModel = viewModel

    super.init(nibName: nil, bundle: nil)
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override func viewDidLoad() {
    super.viewDidLoad()

    addChild(viewController: viewController)
  }
}

private extension ModalContainerViewController {
  func addChild(viewController: UIViewController) {
    addChild(viewController)
    stackView.addArrangedSubview(viewController.view)
  }
}

