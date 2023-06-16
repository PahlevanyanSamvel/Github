//
//  TrandingRepositoryCell.swift
//  Github
//
//  Created by Samvel Pahlevanyan on 15.06.23.
//

import UIKit
import Kingfisher

final class TrandingRepositoryCell: UITableViewCell {
  @IBOutlet private weak var indexLabel: UILabel!
  @IBOutlet private weak var userName: UILabel!
  @IBOutlet private weak var stargazersLabel: UILabel!
  @IBOutlet private weak var ownerAvatar: UIImageView!
  @IBOutlet private weak var descriptionLabel: UILabel!

  func setData(repository: Repository, index: Int) {
    userName.text = repository.owner.login
    descriptionLabel.text = repository.description
    stargazersLabel.text = "\(repository.stargazersCount)"
    indexLabel.text = "\(index+1)"
    loadImage(avatarUrl: repository.owner.avatarUrl)
  }

  private func loadImage(avatarUrl: String) {
    if let url = URL(string: avatarUrl) {
      ownerAvatar.kf.setImage(with: url)
    }
  }
}
