//
//  ArticleDetailAdapter.swift
//  NYTimesArticleApp
//
//  Created by Alya Filon  on 06.05.2020.
//  Copyright © 2020 AlyaFilon. All rights reserved.
//

import UIKit

class ArticleDetailAdapter: NSObject {

  weak var delegate: TappingFromCellInterface?

  private let tableView: UITableView
  private var article: ArticleInfo!
  private var isMediaExist: Bool {
    return article.mediaURL != nil
  }

  init(tableView: UITableView, article: ArticleInfo) {
    self.tableView = tableView
    self.article = article
    super.init()

    tableView.dataSource = self
    registerCells()
  }

  private func registerCells() {
    tableView.register(UINib(nibName: ArticleTitleCell.identifier, bundle: nil),
                        forCellReuseIdentifier: ArticleTitleCell.identifier)
    tableView.register(UINib(nibName: ArticleInfoCell.identifier, bundle: nil),
                       forCellReuseIdentifier: ArticleInfoCell.identifier)
    tableView.register(UINib(nibName: ArticleMediaCell.identifier, bundle: nil),
                       forCellReuseIdentifier: ArticleMediaCell.identifier)
  }

}

//MARK: - UITableViewDataSource

extension ArticleDetailAdapter: UITableViewDataSource {

  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return TableViewLayout.rows(isMediaExist: isMediaExist).count
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let row = TableViewLayout.rows(isMediaExist: isMediaExist)[indexPath.row]

    switch row {
    case .title:
      let cell = tableView.dequeueReusableCell(withIdentifier: row.identifier, for: indexPath) as! ArticleTitleCell
      cell.apply(article)
      return cell
    case .info:
      let cell = tableView.dequeueReusableCell(withIdentifier: row.identifier, for: indexPath) as! ArticleInfoCell
      cell.apply(article)
      cell.delegate = delegate
      return cell
    case .media:
      let cell = tableView.dequeueReusableCell(withIdentifier: row.identifier, for: indexPath) as! ArticleMediaCell
      cell.apply(article)
      return cell
    }
  }

}

//MARK: - TableViewLayout

private extension ArticleDetailAdapter {

  struct TableViewLayout {

    enum Row {
      case title
      case info
      case media

      var identifier: String {
        switch self {
        case .title: return ArticleTitleCell.identifier
        case .info: return ArticleInfoCell.identifier
        case .media: return ArticleMediaCell.identifier
        }
      }
    }

    static func rows(isMediaExist: Bool) -> [Row] {
      return isMediaExist ? [.title, .info, .media] : [.title, .info]
    }
  }

}
