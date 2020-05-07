//
//  ViewedPresenter.swift
//  NYTimesArticleApp
//
//  Created by Alya Filon  on 06.05.2020.
//  Copyright © 2020 AlyaFilon. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

protocol ViewedPresenterInterface: CommonPresenterInterface { }

class ViewedPresenter {

  var interactor: InteractorInterface!
  var router: CommonRouterInterface!

  init(interactor: InteractorInterface, router: CommonRouterInterface) {
    self.interactor = interactor
    self.router = router
  }

}

extension ViewedPresenter: ViewedPresenterInterface { }
