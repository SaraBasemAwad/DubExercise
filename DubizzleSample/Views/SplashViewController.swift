//
//  SplashViewController.swift
//  DubizzleSample
//
//  Created by Sara Awad on 2/20/21.
//

import UIKit
import ReactiveSwift
import ReactiveCocoa

class SplashViewController: BaseViewController {
  @IBOutlet private var splashView: SplashView!
  private let fadeInDuration = 2.0
  private let fadeInAlpha: (start: CGFloat, end: CGFloat) = (start: 0.0, end: 1.0)
  private let viewModel: SplashViewModelType
    
  init(viewModel: SplashViewModelType) {
      self.viewModel = viewModel
      super.init(nibName: nil, bundle: nil)
    }
    
 required init?(coder aDecoder: NSCoder) {
      fatalError("Do not initialize from storyboard")
    }
    
    override func viewDidLoad() {
      super.viewDidLoad()

      configureBindings()
    }

    override func viewDidAppear(_ animated: Bool) {
      splashView.alpha = fadeInAlpha.start

      UIView.animate(withDuration: fadeInDuration, animations: {
        self.splashView.alpha = self.fadeInAlpha.end
      }, completion: { _ in
        self.viewModel.complete.apply().start()
      })
    }
  }

private extension SplashViewController {
  func configureBindings() {
    splashView.versionLabel.reactive.text <~ viewModel.appVersion.map { version, build in
      return AppVersionHelpers.formatVersion(version, build: build)
    }
  }
}
