import UIKit

import RxSwift
import RxCocoa
import RxSwiftExt

import MudoxKit

import JacKit

fileprivate let jack = Jack().set(format: .short)

// MARK: Interface

protocol 111ModelInput {

}

protocol 111ModelOutput {

}

protocol 111ModelType: 111ModelInput, 111ModelOutput {
  init()
}

extension 111ModelType {
  var input: 111ModelInput { return self }
  var output: 111ModelOutput { return self }
}

// MARK: - View Model

class 111Model: 111ModelType {

  // MARK: Types


  // MARK: Input


  // MARK: Output


  // MARK: Binding

  var disposeBag = DisposeBag()

  required init() {

  }

}

// MARK: - Types

extension 111Model {



}
