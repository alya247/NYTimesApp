//
//  ArticleWebDetailController.swift
//  NYTimesArticleApp
//
//  Created by Alya Filon  on 06.05.2020.
//  Copyright © 2020 AlyaFilon. All rights reserved.
//

import UIKit
import WebKit

class ArticleWebDetailController: UIViewController {

  @IBOutlet private var webViewContainer: UIView!

  var router: ArticleWebDetailRouterInterface!
  private var webView: WKWebView!

  override func viewDidLoad() {
    super.viewDidLoad()

    setupWebView()
  }

  private func setupWebView() {
    webView = WKWebView(frame: view.frame)
    webViewContainer.addSubview(webView)

    guard let url = URL(string: router.htmlURL) else { return }
    webView.load(URLRequest(url: url))
  }

}
