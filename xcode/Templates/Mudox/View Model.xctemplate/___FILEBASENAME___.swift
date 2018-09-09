import UIKit

import RxSwift
import RxCocoa
import RxSwiftExt

import MudoxKit

import JacKit
fileprivate let jack = Jack()

protocol __1__ViewModelInput {

}

protocol __1__ViewModelOutput {

}

class __1__ViewModel:  __1__ViewModelInput, __1__ViewModelOuput {

  var disposeBag = DisposeBag()

  var input: ViewModelInput { return self }
  var output: ViewModelOutput { return self }

} // ViewModel
