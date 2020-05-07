//
//  TabBarRouter.swift
//  NYTimesArticleApp
//
//  Created by Alya Filon  on 06.05.2020.
//  Copyright © 2020 AlyaFilon. All rights reserved.
//

import UIKit

protocol TabBarInterface {
  var tabIcon: UIImage { get }
  var tabTitle: String { get }
  func configuredViewController() -> UIViewController
}

protocol TabBarRouterInterface {
  func setupWindow(window: UIWindow, items: [TabBarInterface]) -> TabBarRouterInterface
}

class TabBarRouter: TabBarRouterInterface {

  func setupWindow(window: UIWindow, items: [TabBarInterface]) -> TabBarRouterInterface {
    var viewControllers = [UINavigationController]()

    for item in items {
      let tabBarItem = UITabBarItem()
      tabBarItem.title = item.tabTitle
      tabBarItem.image = item.tabIcon.withTintColor(.gray)

      let controller = item.configuredViewController()

      let navigationController = UINavigationController(rootViewController: controller)
      navigationController.tabBarItem = tabBarItem
      viewControllers.append(navigationController)
    }

    let tabBar = UIStoryboard(name: Resource.Storyboard.tabBar.name, bundle: nil).instantiateViewController(withIdentifier: Resource.Controller.tabBar.name) as! TabBarController
    tabBar.viewControllers = viewControllers

    window.rootViewController = tabBar
    return self
  }

}
