//
//  TrandingRepositoryListRepository.swift
//  Github
//
//  Created by Samvel Pahlevanyan on 14.06.23.
//

import Foundation

protocol TrandingRepositoryListRepository {
  func fetchTrandongRepositoryList(page: Int, timeframe: String) async -> Result<TrendingReposResponse, Error>
}
