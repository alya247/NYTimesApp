//
//  ImageLoader.swift
//  NYTimesArticleApp
//
//  Created by Alya Filon  on 06.05.2020.
//  Copyright © 2020 AlyaFilon. All rights reserved.
//

import UIKit

extension UIImageView {

  func load(_ url: URL, placeholder: UIImage? = nil) {

    func setPlaceholder() {
      DispatchQueue.main.async {
        self.image = placeholder
      }
    }

    DispatchQueue.global().async { [weak self] in
      if let data = try? Data(contentsOf: url) {
        if let image = UIImage(data: data) {
          DispatchQueue.main.async {
            self?.image = image
          }
        } else {
          setPlaceholder()
        }
      } else {
        setPlaceholder()
      }
    }
  }

}
