//
//  ProductListViewController.swift
//  DubizzleSample
//
//  Created by Sara Awad on 2/20/21.
//

import Foundation
import ReactiveSwift
import ReactiveCocoa

class ProductListViewController: BaseViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var activityIndicatorView: UIActivityIndicatorView!
    var viewModel: ProductListViewModelType!
    static let cellHeight: CGFloat = 90
    
     init(viewModel: ProductListViewModelType) {
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

      viewModel.inputs.load.apply().start()
      super.viewDidLoad()
    }
}

extension ProductListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.outputs.products.value.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let product = item(for: indexPath)
        let cell = tableView.dequeueReusable(cell: ProductTableViewCell.self, indexPath: indexPath)
        cell.selectionStyle = .none
        cell.update(with: product)
        return cell
    }
}

extension ProductListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
      let product = item(for: indexPath)
      viewModel.inputs.selectProduct.apply(product).start()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return ProductListViewController.cellHeight
    }
    
}

private extension ProductListViewController {
  func configureBindings() {
    activityIndicatorView.reactive.isHidden <~ viewModel.outputs.isLoading.negate()
    
    let products = viewModel.outputs.products.signal
    tableView.reactive.isHidden <~ products.map { $0.isEmpty }
    tableView.reactive.reloadData <~ products.map(value: ())
  }

  func configureUI() {
    configureTableView()
  }
    
  func configureTableView() {
    tableView.register(cell: ProductTableViewCell.self)
  }
    
  func item(for indexPath: IndexPath) -> ProductPresentableModel {
    return viewModel.outputs.products.value[indexPath.item]
  }
    
}

