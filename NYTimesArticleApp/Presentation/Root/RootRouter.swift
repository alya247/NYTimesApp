//
//  RootRouter.swift
//  NYTimesArticleApp
//
//  Created by Alya Filon  on 06.05.2020.
//  Copyright © 2020 AlyaFilon. All rights reserved.
//

import UIKit

class RootRouter {

  private weak var window: UIWindow!

  private let coreDataStack: CoreDataStack

  init(coreDataStack: CoreDataStack) {
    self.coreDataStack = coreDataStack
  }

  func execute(_ context: UIWindow) {
    window = context

    var routers: [TabBarInterface] = []

    let emailed: EmailedRouterInterface = EmailedRouter(coreDataStack: coreDataStack)
    let shared: SharedRouterInterface = SharedRouter(coreDataStack: coreDataStack)
    let viewed: ViewedRouterInterface = ViewedRouter(coreDataStack: coreDataStack)

    routers = [emailed as! TabBarInterface, shared as! TabBarInterface, viewed as! TabBarInterface]
    _ = TabBarRouter().setupWindow(window: window, items: routers)
  }

}
