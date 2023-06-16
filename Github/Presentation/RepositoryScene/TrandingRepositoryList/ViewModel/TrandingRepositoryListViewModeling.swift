//
//  TrandingRepositoryListViewModeling.swift
//  Github
//
//  Created by Samvel Pahlevanyan on 14.06.23.
//

import Foundation

protocol TrandingRepositoryListViewModeling: BaseViewModeling {
  func numberOfRows() -> Int
  func object(at index: Int) -> Repository
  func pullToRefresh()
  func loadMore()
  func changeTimeframe(at index: Int)
  func didSelectRowAt(at index: Int)
  var showPullToRefreshLoading: ((Bool)-> Void)? {get set}
  var showLoadMoreLoading: ((Bool)-> Void)? {get set}
  var realodData: (()-> Void)? {get set}
}
