//
//  TableViewAdapter.swift
//  NYTimesArticleApp
//
//  Created by Alya Filon  on 06.05.2020.
//  Copyright © 2020 AlyaFilon. All rights reserved.
//

import UIKit

protocol ArticleSelectionInterface: class {
  func didSelect(_ article: ArticleInfo)
}

class TableViewAdapter: NSObject {

  weak var delegate: ArticleSelectionInterface?

  private let tableView: UITableView
  private var articles: [ArticleInfo]

  init(tableView: UITableView, articles: [ArticleInfo]) {
    self.tableView = tableView
    self.articles = articles
    super.init()

    tableView.register(UINib(nibName: ArticlePreviewCell.identifier, bundle: nil), forCellReuseIdentifier: ArticlePreviewCell.identifier)

    tableView.dataSource = self
    tableView.delegate = self
    tableView.reloadData()
  }

  func reload(_ articles: [ArticleInfo]) {
    self.articles = articles
    tableView.reloadData()
  }

}

//MARK: - UITableViewDataSource

extension TableViewAdapter: UITableViewDataSource {

  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return articles.count
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: ArticlePreviewCell.identifier, for: indexPath) as! ArticlePreviewCell
    cell.apply(articles[indexPath.row])
    return cell
  }
  
}

//MARK: - UITableViewDelegate

extension TableViewAdapter: UITableViewDelegate {

  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    delegate?.didSelect(articles[indexPath.row])
  }

}
