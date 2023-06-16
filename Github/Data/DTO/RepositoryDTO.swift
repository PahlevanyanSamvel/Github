//
//  RepositoryDTO.swift
//  Github
//
//  Created by Samvel Pahlevanyan on 15.06.23.
//

import Foundation

struct RepositoryDTO: Codable, DomainConvertible {
  var owner: UserDTO
  var description: String?
  var language: String?
  var stargazersCount: Int
  var forksCount: Int
  var createdAt: String
  var htmlUrl: String

  enum CodingKeys: String, CodingKey {
    case owner, description, language
    case stargazersCount = "stargazers_count"
    case forksCount = "forks_count"
    case createdAt = "created_at"
    case htmlUrl = "html_url"
  }

  func toDomain() -> Repository {
    .init(owner: owner.toDomain(),
          description: description,
          language: language,
          stargazersCount: stargazersCount,
          forksCount: forksCount,
          createdAt: createdAt,
          htmlUrl: htmlUrl)
  }
}
