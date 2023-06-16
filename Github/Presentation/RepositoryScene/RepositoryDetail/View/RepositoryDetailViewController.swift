//
//  RepositoryDetailViewController.swift
//  Github
//
//  Created by Samvel Pahlevanyan on 15.06.23.
//

import UIKit

final class RepositoryDetailViewController: BaseVC {
  @IBOutlet weak var lengageLabel: UILabel!
  @IBOutlet weak var numberOfForksLabel: UILabel!
  @IBOutlet weak var creationDateLabel: UILabel!
  @IBOutlet weak var githubLinkButton: UIButton!

  lazy private var viewModel: RepositoryDetailViewModeling = baseVM as! RepositoryDetailViewModeling

  override func viewDidLoad() {
    super.viewDidLoad()
    setupUI()
  }

  private func setupUI() {
    lengageLabel.text = viewModel.language
    numberOfForksLabel.text = viewModel.forksCount
    creationDateLabel.text = viewModel.creationDate
    githubLinkButton.setAttributedTitle(viewModel.gitHubPageLinkAttributedString, for: .normal)
  }

  @IBAction func githubLinkTapped(_ sender: Any) {
    guard let url = viewModel.githubLink else { return }
    UIApplication.shared.open(url)
  }
}
