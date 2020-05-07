//
//  EmailedPresenter.swift
//  NYTimesArticleApp
//
//  Created by Alya Filon  on 06.05.2020.
//  Copyright © 2020 AlyaFilon. All rights reserved.
//

import Foundation

protocol EmailedPresenterInterface: CommonPresenterInterface { }

class EmailedPresenter: EmailedPresenterInterface {

  var interactor: InteractorInterface!
  var router: CommonRouterInterface!

  init(interactor: InteractorInterface, router: CommonRouterInterface) {
    self.interactor = interactor
    self.router = router
  }

}
