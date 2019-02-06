import UIKit

import RxSwift
import RxCocoa

import MudoxKit
import JacKit

private let jack = Jack().set(format: .short)

class 111Controller: ViewController {

  // MARK: - Subviews

  // MARK: - View

  override func setupView() {
    
  }

  // MARK: - Model

  let model: 111ModelType = fx()

  override func setupModel() {
    
  }

}

// MARK: - Binders

extension Reactive where Base: 111Controller {
  
}