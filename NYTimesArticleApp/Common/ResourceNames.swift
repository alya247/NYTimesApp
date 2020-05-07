//
//  ResourceNames.swift
//  NYTimesArticleApp
//
//  Created by Alya Filon  on 07.05.2020.
//  Copyright © 2020 AlyaFilon. All rights reserved.
//

import UIKit

enum Resource {

  enum Asset {
    case sharedIcon
    case viewedIcon
    case emailedIcon
    case savedIcon
    case unsavedIcon

    var image: UIImage {
      switch self {
      case .sharedIcon: return UIImage(named: "shared_icon")!
      case .viewedIcon: return UIImage(named: "viewed_icon")!
      case .emailedIcon: return UIImage(named: "emailed_icon")!
      case .savedIcon: return UIImage(named: "saved_icon")!
      case .unsavedIcon: return UIImage(named: "unsaved_icon")!
      }
    }
  }

  enum Storyboard {
    case tabBar
    case emailed
    case shared
    case viewed
    case detail
    case saved

    var name: String {
      switch self {
      case .tabBar: return  "TabBar"
      case .emailed: return  "Emailed"
      case .shared: return  "Shared"
      case .viewed: return  "Viewed"
      case .detail: return  "ArticleDetail"
      case .saved: return  "SavedArticle"
      }
    }
  }

  enum Controller {
    case tabBar
    case emailed
    case shared
    case viewed
    case detail
    case detailWeb
    case saved

    var name: String {
      switch self {
      case .tabBar: return  "TabBarController"
      case .emailed: return  "EmailedController"
      case .shared: return  "SharedController"
      case .viewed: return  "ViewedController"
      case .detail: return  "ArticleDetailController"
      case .detailWeb: return  "ArticleWebDetailController"
      case .saved: return  "SavedArticleController"
      }
    }
  }

}
