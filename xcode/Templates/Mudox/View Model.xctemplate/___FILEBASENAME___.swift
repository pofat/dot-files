import UIKit

import RxSwift
import RxCocoa
import RxSwiftExt

import MudoxKit

import JacKit
fileprivate let jack = Jack()

extension <#View Controller#> {

  class ViewModel {

    var disposeBag = DisposeBag()

    // Outputs
    let username: Driver<String>
    let isDarkMode: Driver<Bool>

    init(
      input: (
        buttonTap: Driver<Void>,
        darkModeSwitchIsOn: Driver<Bool>
      ),
      dependency: (
        userService: UserService,
        preferencesService: PreferencesService
      )
    )
    {

    }

  } // ViewModel

} // View Controller
