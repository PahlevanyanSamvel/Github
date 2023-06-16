//
//  DefaultTrandingRepositoryListRepository.swift
//  Github
//
//  Created by Samvel Pahlevanyan on 14.06.23.
//

import Foundation

class DefaultTrandingRepositoryListRepository {
  let apiDataSource: TrandingRepositoryListApiDataSource

  init(apiDataSource: TrandingRepositoryListApiDataSource) {
    self.apiDataSource = apiDataSource
  }
}

extension DefaultTrandingRepositoryListRepository: TrandingRepositoryListRepository {
  func fetchTrandongRepositoryList(page: Int, timeframe: String) async -> Result<TrendingReposResponse, Error> {
    let result = await apiDataSource.fetchTrandingRepositoruList(page: page, timeframe: timeframe)
    switch result {
    case .success(let response):
      return .success(response.toDomain())
    case .failure(let error):
      return .failure(error)
    }
  }
}
