import UIKit

import RxCocoa
import RxSwift

import SnapKit

class 111View: UIView {

  @available(*, unavailable)
  required init?(coder aDecoder: NSCoder) {
    fatalError("do not use it")
  }

  init() {
    super.init(frame: .zero)

    setupView()
  }

  // MARK: - Subviews

  // MARK: - Constants

  // MARK: - View

  func setupView() {

  }

  // MARK: - Model

  var disposeBag = DisposeBag()

}
