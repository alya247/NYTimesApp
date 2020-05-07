//
//  EmailedController.swift
//  NYTimesArticleApp
//
//  Created by Alya Filon  on 06.05.2020.
//  Copyright © 2020 AlyaFilon. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class EmailedController: UIViewController {

  @IBOutlet private var tableView: UITableView!

  var presenter: EmailedPresenterInterface!
  private let bag = DisposeBag()
  private var adapter: TableViewAdapter!

  override func viewDidLoad() {
    super.viewDidLoad()

    title = "MOST EMAILED"
    navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Saved", style: .plain, target: self, action: #selector(openSavedArticles))

    presenter.loadViewdArticles()
    presenter.articles.observeOn(MainScheduler.instance).subscribe(onNext: { [weak self] articles in
      guard let `self` = self else { return }
      self.adapter = TableViewAdapter(tableView: self.tableView, articles: articles)
      self.adapter.delegate = self
    }).disposed(by: bag)
  }

  @objc private func openSavedArticles() {
    presenter.openSavedArticles()
  }

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    setBarAppearance(.orange)
  }
  
}

//MARK: - ArticleSelectionInterface

extension EmailedController: ArticleSelectionInterface {

  func didSelect(_ article: ArticleInfo) {
    presenter.openArticleDetail(article)
  }

}
