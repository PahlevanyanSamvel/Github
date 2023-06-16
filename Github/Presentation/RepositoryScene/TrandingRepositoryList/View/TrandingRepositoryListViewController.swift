//
//  RepositoryListViewController.swift
//  Github
//
//  Created by Samvel Pahlevanyan on 14.06.23.
//

import UIKit
import ESPullToRefresh

final class TrandingRepositoryListViewController: BaseVC {
  @IBOutlet weak var segmentedControl: UISegmentedControl!
  lazy private var viewModel: TrandingRepositoryListViewModeling = baseVM as! TrandingRepositoryListViewModeling

  @IBOutlet weak var tableView: UITableView!

  override func viewDidLoad() {
    super.viewDidLoad()
    registerCell()
    setupUI()
  }

  override func setupBindings() {
    self.tableView.es.addPullToRefresh {
      self.viewModel.pullToRefresh()
    }

    self.tableView.es.addInfiniteScrolling {
      self.viewModel.loadMore()
    }

    viewModel.realodData = { [weak self] in
      self?.tableView.reloadData()
    }

    viewModel.showPullToRefreshLoading = { [weak self] _ in
      self?.tableView.es.stopPullToRefresh()
    }

    viewModel.showLoadMoreLoading = { [weak self] _ in
      self?.tableView.es.stopLoadingMore()
    }
  }

  private func setupUI() {
    segmentedControl.setTitleTextAttributes([.foregroundColor: UIColor.white], for: .selected)
    segmentedControl.setTitleTextAttributes([.foregroundColor: UIColor.white], for: .normal)
  }

  @IBAction func segmentedControlChange(_ sender: UISegmentedControl) {
    viewModel.changeTimeframe(at: sender.selectedSegmentIndex)
  }

  func registerCell() {
    tableView.register(.init(nibName: TrandingRepositoryCell.className, bundle: nil), forCellReuseIdentifier: TrandingRepositoryCell.className)
  }
}

extension TrandingRepositoryListViewController: UITableViewDelegate, UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    viewModel.numberOfRows()
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: TrandingRepositoryCell.className, for: indexPath) as! TrandingRepositoryCell
    cell.setData(repository: viewModel.object(at: indexPath.row), index: indexPath.row)
    return cell
  }

  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    viewModel.didSelectRowAt(at: indexPath.row)
    tableView.deselectRow(at: indexPath, animated: true)
  }
}
