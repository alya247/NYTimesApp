//
//  DataManager.swift
//  NYTimesArticleApp
//
//  Created by Alya Filon  on 06.05.2020.
//  Copyright © 2020 AlyaFilon. All rights reserved.
//

import Foundation
import CoreData

class DataManager {

  let context: NSManagedObjectContext

  init(context: NSManagedObjectContext) {
    self.context = context
  }

  func isArticleSaved(_ id: Double) -> Bool {
    let request = articleRequest(for: id)
    guard let _ = try? context.fetch(request).first else { return false }
    return true
  }

  func deleteArticle(_ id: Double) {
    let request = articleRequest(for: id)
    if let object = try? context.fetch(request).first {
      context.delete(object)
    }
  }

  func saveArticle(_ article: ArticleInfo) {
    let model = ArticleModel(context: context)
    model.id = Int64(article.id)
    model.title = article.title
    model.section = article.section
    model.abstract = article.abstract
    model.creationDate = article.creationDate
    model.author = article.author
    model.caption = article.caption
    model.url = article.url
    model.mediaURL = article.mediaURL?.absoluteString

    guard context.hasChanges else { return }
    do {
      try context.save()
    } catch let error as NSError {
      print("Unresolved error \(error), \(error.userInfo)")
    }
  }

  func getArticles() -> [ArticleInfo] {
    let request: NSFetchRequest<ArticleModel> = ArticleModel.fetchRequest()
    if let results = try? context.fetch(request) {
      return results.compactMap { ArticleInfo(object: $0) }
    }
    return []
  }
  
}

//MARK: - Private Methods

extension DataManager {

  private func articleRequest(for id: Double) -> NSFetchRequest<ArticleModel> {
    let predicate = NSPredicate(format: "id == \(id)")
    let request: NSFetchRequest<ArticleModel> = ArticleModel.fetchRequest()
    request.predicate = predicate
    return request
  }

}
