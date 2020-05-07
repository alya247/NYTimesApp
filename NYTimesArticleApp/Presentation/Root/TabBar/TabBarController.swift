//
//  TabBarController.swift
//  NYTimesArticleApp
//
//  Created by Alya Filon  on 06.05.2020.
//  Copyright © 2020 AlyaFilon. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {

  override func viewDidLoad() {
    super.viewDidLoad()

    tabBar.backgroundColor = .white
    tabBar.isOpaque = false
    tabBar.isTranslucent = false
    tabBar.tintColor = .black
  }

}
