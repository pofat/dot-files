import UIKit

import RxSwift
import RxCocoa

import JacKit

fileprivate let jack = Jack().set(format: .short)

class 111ViewController: UIViewController {

  init(model: 111ModelType) {
    self.model = model
    super.init(nibName: nil, bundle: nil)
  }

  @available(*, unavailable, message: "init(coder:) has not been implemented")
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override func viewDidLoad() {
    super.viewDidLoad()

    setupView()
    setupModel()
  }

  // MARK: - View

  func setupView() {

  }

  // MARK: - Model

  var disposeBag = DisposeBag()
  let model: 111ViewModelType

  func setupModel() {

  }

}
