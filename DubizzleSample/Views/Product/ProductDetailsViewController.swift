//
//  ProductDetailsViewController.swift
//  DubizzleSample
//
//  Created by Sara Awad on 2/20/21.
//

import Foundation
import ReactiveSwift
import ReactiveCocoa

class ProductDetailsViewController: BaseViewController {

    @IBOutlet weak private var productImageView: UIImageView!
    @IBOutlet weak private var priceLabel: UILabel!
    @IBOutlet weak private var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak private var closeButton: UIButton!
    
    var viewModel: ProductDetailsViewModelType!
    private static let placeholderImage = UIImage(named: "productPlaceholder")
    
     init(viewModel: ProductDetailsViewModelType) {
      self.viewModel = viewModel
      super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
      fatalError("Do not initialize from storyboard")
    }

    override func viewDidLoad() {
      super.viewDidLoad()
      configureBindings()
      configureUI()
      super.viewDidLoad()
    }
}

private extension ProductDetailsViewController {
  func configureBindings() {
    let product = viewModel.outputs.product.producer.skipNil()
    nameLabel.reactive.text <~ product.map(\.name)
    priceLabel.reactive.text <~ product.map(\.price)
    productImageView.reactive.imageUrl(with: ProductDetailsViewController.placeholderImage) <~ product.map(\.imageURL)
    
    closeButton.reactive.pressed = CocoaAction(viewModel.inputs.cancel)
    reactive.onDismiss <~ viewModel.outputs.onCancel
  }

  func configureUI() {
    nameLabel.textColor = .black
    priceLabel.textColor = .black
    priceLabel.font = UIFont(name:"HelveticaNeue-Bold", size: 18.0)
    descriptionLabel.textColor = .black
    descriptionLabel.font = UIFont(name:"HelveticaNeue", size: 14.0)
    productImageView.contentMode = .scaleAspectFill
    view.backgroundColor = .white
  }
}

private extension Reactive where Base: ProductDetailsViewController {
  var onDismiss: BindingTarget<Void> {
    return makeBindingTarget { base, _ in
      base.dismiss(animated: true)
    }
  }
}
