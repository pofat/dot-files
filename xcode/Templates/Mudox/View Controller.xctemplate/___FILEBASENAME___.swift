import UIKit

import RxSwift
import RxCocoa

import MudoxKit

import JacKit
fileprivate let jack = Jack()

class <#Subclass#>: <#Super Class#> {

  var disposeBag = DisposeBag()

  // MARK: IBOutlets



  // MARK: - View Model

  var disposeBag = DisposeBag()
  var viewModel: ViewModel!

  // - Prepare view model initializer parameters.
  // - Create and retain view model instance.
  func setupViewModel() {

  }

  // - Bind view model's output properties to UI components.
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
