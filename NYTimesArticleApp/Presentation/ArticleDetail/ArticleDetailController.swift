//
//  ArticleDetailController.swift
//  NYTimesArticleApp
//
//  Created by Alya Filon  on 06.05.2020.
//  Copyright © 2020 AlyaFilon. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ArticleDetailController: UIViewController {

  @IBOutlet private var tableView: UITableView!

  var presenter: ArticleDetailPresenterInterface!
  private let bag = DisposeBag()
  private var adapter: ArticleDetailAdapter!

  override func viewDidLoad() {
    super.viewDidLoad()

    setBarAppearance(.white)
    adapter = ArticleDetailAdapter(tableView: tableView, article: presenter.article)

    presenter.isArticleSaved.observeOn(MainScheduler.instance).subscribe(onNext: { [weak self] isSaved in
      guard let `self` = self else { return }
      let image = isSaved ? Resource.Asset.savedIcon.image : Resource.Asset.unsavedIcon.image
      self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: image, style: .plain, target: self, action: #selector(self.saveArticleIfNeeded))
    }).disposed(by: bag)
  }

  @objc private func saveArticleIfNeeded() {
    presenter.saveArticleIfNeeded()
  }

}

//MARK: - TappingFromCellInterface

extension ArticleDetailController: TappingFromCellInterface {

  func didSelect() {
    presenter.viewFullArticle()
  }

}
