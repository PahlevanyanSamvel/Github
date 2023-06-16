//
//  RepositoryListFlowCoordinator.swift
//  Github
//
//  Created by Samvel Pahlevanyan on 14.06.23.
//

import UIKit

final class RepositoryListFlowCoordinator {

  private weak var navigationController: UINavigationController?

  init(navigationController: UINavigationController) {
    self.navigationController = navigationController
  }

  func start() {
    let netwotkingService = NetwotkingService()
    let apiDataSource = TrandingRepositoryListApiDataSource(netwotking: netwotkingService)
    let repository = DefaultTrandingRepositoryListRepository(apiDataSource: apiDataSource)
    let useCase = DefaultGetTrandingRepositoryListUseCase(repositiory: repository)
    let actions = Actions(showMovieDetails: showMovieDetails)
    let viewModel = TrandingRepositoryListViewModel(useCase: useCase, actions: actions)
    let vc = TrandingRepositoryListViewController(viewModel: viewModel)
    navigationController?.pushViewController(vc, animated: false)
  }

  private func showMovieDetails(repository: Repository) {
    let viewModel = RepositoryDetailViewModel(repository: repository)
    let vc = RepositoryDetailViewController(viewModel: viewModel)
    navigationController?.pushViewController(vc, animated: true)
  }
}

extension RepositoryListFlowCoordinator {
  struct Actions {
    let showMovieDetails: (Repository) -> Void
  }
}
