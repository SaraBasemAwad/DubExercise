//
//  ProductTableViewCell.swift
//  DubizzleSample
//
//  Created by Sara Awad on 2/20/21.
//

import UIKit
import ReactiveSwift
import ReactiveCocoa
import SDWebImage

class ProductTableViewCell: UITableViewCell, Cell {
    
    @IBOutlet private weak var productImageView: UIImageView!
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var priceLabel: UILabel!
    fileprivate var product: MutableProperty<ProductPresentableModel?> = MutableProperty(nil)
    private static let placeholderImage = UIImage(named: "productPlaceholder")
    
    override func awakeFromNib() {
      super.awakeFromNib()

      configureBindings()
    }
    
    func update(with product: ProductPresentableModel) {
        self.product.value = product
    }
}

extension ProductTableViewCell {
  static var nibName: String {
    return ProductTableViewCell.nibName()
  }

  static var nib: UINib {
    return ProductTableViewCell.nib()
  }

  static var identifier: String {
    return ProductTableViewCell.identifier()
  }
}

private extension ProductTableViewCell {
    func configureSubviews() {
        productImageView.contentMode = .scaleAspectFit
    }
    func configureBindings() {
        let nonNilProduct = product.producer.skipNil()
        nameLabel.reactive.text <~ nonNilProduct.map(\.name)
        priceLabel.reactive.text <~ nonNilProduct.map(\.price)

        productImageView.reactive.imageUrl(with: ProductTableViewCell.placeholderImage) <~ nonNilProduct.map(\.imageURL)
    }
}

@available(iOS 11.0, *)
extension ProductTableViewCell {
    @objc func _setSeparatorsDrawInVibrantLightModeUIAppearance(_ value: Bool) {

    }
    
    @objc func _setSeparatorDrawsInVibrantLightMode(_ value: Bool) {

     }
}
