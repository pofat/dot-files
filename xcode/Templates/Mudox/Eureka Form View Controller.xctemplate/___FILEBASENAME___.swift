import UIKit

import RxSwift
import RxCocoa

import Eureka

import MudoxKit

import JacKit
fileprivate let jack = Jack.with(levelOfThisFile: .verbose)

class <#CustomViewController#>: FormViewController {

  var disposeBag = DisposeBag()

  override func viewDidLoad() {
    super.viewDidLoad()

    setupForm()
    setupViewModel()
  }

  func setupForm() {
    fatalError("Unimplemented")
  }

  func setupViewModel {
    fatalError("Unimplemented")
  }
}
