//
//  Repository.swift
//  Github
//
//  Created by Samvel Pahlevanyan on 15.06.23.
//

import Foundation

struct Repository {
  var owner: User
  var description: String?
  var language: String?
  var stargazersCount: Int
  var forksCount: Int
  var createdAt: String
  var htmlUrl: String
}

