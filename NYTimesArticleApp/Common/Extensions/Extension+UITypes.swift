//
//  Extension+UITypes.swift
//  NYTimesArticleApp
//
//  Created by Alya Filon  on 06.05.2020.
//  Copyright © 2020 AlyaFilon. All rights reserved.
//

import UIKit

//MARK: - UIView

extension UIView {

  @IBInspectable
  var cornerRadius: CGFloat {
    get {
      return layer.cornerRadius
    }
    set {
      layer.cornerRadius = newValue
    }
  }

  @IBInspectable
  var borderWidth: CGFloat {
    get {
      return layer.borderWidth
    }
    set {
      layer.borderWidth = newValue
    }
  }

  @IBInspectable
  var borderColor: UIColor {
    get {
      return UIColor(cgColor: self.layer.borderColor!)
    }
    set {
      self.layer.borderColor = newValue.cgColor
    }
  }

}

//MARK: - UIViewController

extension UIViewController {

  func setBarAppearance(_ type: NavigationBarAppearance) {
    func setupBar(_ bar: UINavigationBar?) {
      bar?.setBackgroundImage(UIImage(), for: .default)
      bar?.shadowImage = UIImage()
      bar?.isTranslucent = true
      bar?.tintColor = type.tintColor
      bar?.backgroundColor = type.backgroundColor
    }

    if let `self` = self as? UINavigationController {
      setupBar(self.navigationBar)
    } else {
      setupBar(navigationController?.navigationBar)
    }
  }

}

//MARK: - NavigationBarAppearance

enum NavigationBarAppearance {
  case orange
  case blue
  case indigo
  case white
  case green

  var backgroundColor: UIColor {
    switch self {
    case .orange: return .systemOrange
    case .blue: return .systemTeal
    case .indigo: return .systemIndigo
    case .white: return .white
    case .green: return .systemGreen
    }
  }

  var tintColor: UIColor {
    return .black
  }
}
