import UIKit

import RxSwift
import RxCocoa

import MudoxKit

import JacKit
fileprivate let jack = Jack()

class <#Subclass#>: <#Super Class#> {

  // MARK: IBOutlets



  // MARK: - View Model

  var disposeBag = DisposeBag()
  var viewModel: ViewModel!

  // Create & drive view model
  func setupViewModel() {

  }

  // Bind view model back to view controller
  func bindViewModel() {

  }

  // MARK: - Lifecycle

  // - Create subviews.
  // - Create auto layout constraints.
  func setupView() {

  }

  // Resign keyboard at appropriate time.
  func setupKeyboard() {

  }

  // Setup reactive binding between UI components.
  func setupUIBinding() {

  }

  override func viewDidLoad() {
    super.viewDidLoad()

    setupView()
    setupUIBinding()
    setupKeyboard()

    setupViewModel()
    bindViewModel()
  }

}
