//
//  GetTrandingRepositoryListUseCase.swift
//  Github
//
//  Created by Samvel Pahlevanyan on 15.06.23.
//

import Foundation


protocol GetTrandingRepositoryListUseCase {
  func execute(isFromStart: Bool, localListCount: Int) async -> [Repository]
  var timeframe: Timeframe? { get set }
}

final class DefaultGetTrandingRepositoryListUseCase: GetTrandingRepositoryListUseCase {
  private var page = 0
  private var hasNextPage = true
  private let repositiory: TrandingRepositoryListRepository
  var timeframe: Timeframe?

  init(repositiory: TrandingRepositoryListRepository) {
    self.repositiory = repositiory
  }

  func execute(isFromStart: Bool, localListCount: Int) async -> [Repository] {
    guard hasNextPage else { return [] }
    page = isFromStart ? 0 : page
    let timeframe = timeframe ?? .lastDay
    let result = await repositiory.fetchTrandongRepositoryList(page: page, timeframe: timeframe.stringDateFrame)
    switch result {
    case .success(let repo):
      hasNextPage = (localListCount + repo.items.count) < repo.totalCount
      page += 1
      return repo.items
    case .failure(let error):
      print(error)

      return []
    }
  }
}
