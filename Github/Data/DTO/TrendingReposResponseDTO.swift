//
//  TrendingRepoResponse.swift
//  Github
//
//  Created by Samvel Pahlevanyan on 15.06.23.
//

import Foundation

struct TrendingReposResponseDTO: Codable, DomainConvertible {
  var items: [RepositoryDTO]
  var totalCount: Int

  enum CodingKeys: String, CodingKey {
    case items
    case totalCount = "total_count"
  }

  func toDomain() -> TrendingReposResponse {
    .init(items: items.toDomain(), totalCount: totalCount)
  }
}
