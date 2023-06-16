//
//  TrandingRepositoryListViewModel.swift
//  Github
//
//  Created by Samvel Pahlevanyan on 14.06.23.
//

import Foundation

class TrandingRepositoryListViewModel: BaseViewModel {
  private var list: [Repository] = []
  private var actions: RepositoryListFlowCoordinator.Actions!
  var useCase: GetTrandingRepositoryListUseCase!
  var showPullToRefreshLoading: ((Bool)-> Void)?
  var showLoadMoreLoading: ((Bool)-> Void)?
  var realodData: (()-> Void)?
  var timeframe: Timeframe = .lastDay

  init(useCase: GetTrandingRepositoryListUseCase,
       actions: RepositoryListFlowCoordinator.Actions) {
    super.init()
    self.useCase = useCase
    self.actions = actions
    pullToRefresh()
  }
}

extension TrandingRepositoryListViewModel: TrandingRepositoryListViewModeling {
  func pullToRefresh() {
    showPullToRefreshLoading?(true)
    Task { @MainActor in
      let result = await useCase.execute(isFromStart: true, localListCount: 0)
      list = result
      showPullToRefreshLoading?(false)
      realodData?()
    }
  }

  func loadMore() {
    showLoadMoreLoading?(true)
    Task { @MainActor in
      let result = await useCase.execute(isFromStart: false, localListCount: list.count)
      list.append(contentsOf: result)
      showLoadMoreLoading?(false)
      realodData?()
    }
  }

  func numberOfRows() -> Int {
    list.count
  }

  func object(at index: Int) -> Repository {
    list[index]
  }

  func changeTimeframe(at index: Int) {
    useCase.timeframe = Timeframe(rawValue: index)
    pullToRefresh()
  }

  func didSelectRowAt(at index: Int) {
    actions.showMovieDetails(object(at: index))
  }
}
