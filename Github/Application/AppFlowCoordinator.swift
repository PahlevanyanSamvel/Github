//
//  AppFlowCoordinator.swift
//  Github
//
//  Created by Samvel Pahlevanyan on 14.06.23.
//

import UIKit

final class AppFlowCoordinator {

    var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let flow = RepositoryListFlowCoordinator(navigationController: navigationController)
        flow.start()
    }
}
