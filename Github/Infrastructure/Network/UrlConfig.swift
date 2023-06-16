//
//  UrlConfig.swift
//  Github
//
//  Created by Samvel Pahlevanyan on 14.06.23.
//

import Foundation

struct UrlConfig {
  var baseUrl: String
  var path: String

  init(baseUrl: String = "api.github.com", path: String) {
    self.baseUrl = baseUrl
    self.path = path
  }
}

