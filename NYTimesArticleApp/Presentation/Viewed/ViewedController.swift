//
//  ViewedController.swift
//  NYTimesArticleApp
//
//  Created by Alya Filon  on 06.05.2020.
//  Copyright © 2020 AlyaFilon. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ViewedController: UIViewController {

  @IBOutlet private var tableView: UITableView!

  var presenter: ViewedPresenterInterface!
  private let bag = DisposeBag()
  private var adapter: TableViewAdapter!

  override func viewDidLoad() {
    super.viewDidLoad()

    title = "MOST VIEWED"
    navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Saved", style: .plain, target: self, action: #selector(openSavedArticles))

    presenter.loadViewdArticles()
    presenter.articles.observeOn(MainScheduler.instance).subscribe(onNext: { [weak self] articles in
      guard let `self` = self else { return }
      self.adapter = TableViewAdapter(tableView: self.tableView, articles: articles)
      self.adapter.delegate = self
    }).disposed(by: bag)
  }

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    setBarAppearance(.indigo)
  }

  @objc private func openSavedArticles() {
    presenter.openSavedArticles()
  }

}

//MARK: - ArticleSelectionInterface

extension ViewedController: ArticleSelectionInterface {

  func didSelect(_ article: ArticleInfo) {
    presenter.openArticleDetail(article)
  }

}
