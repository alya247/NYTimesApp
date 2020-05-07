//
//  SavedArticleController.swift
//  NYTimesArticleApp
//
//  Created by Alya Filon  on 06.05.2020.
//  Copyright © 2020 AlyaFilon. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class SavedArticleController: UIViewController {

  @IBOutlet private var tableView: UITableView!

  var presenter: SavedArticlePresenterInterface!
  private let bag = DisposeBag()
  private var adapter: TableViewAdapter!

  override func viewDidLoad() {
    super.viewDidLoad()

    adapter = TableViewAdapter(tableView: tableView, articles: presenter.articles)
    adapter.delegate = self
  }

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    setBarAppearance(.green)
  }

  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    adapter.reload(presenter.articles)
  }

}

//MARK: - ArticleSelectionInterface

extension SavedArticleController: ArticleSelectionInterface {

  func didSelect(_ article: ArticleInfo) {
    presenter.openArticleDetail(article)
  }

}
