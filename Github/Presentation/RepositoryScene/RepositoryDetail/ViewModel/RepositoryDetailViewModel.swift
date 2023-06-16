//
//  RepositoryDetailViewModel.swift
//  Github
//
//  Created by Samvel Pahlevanyan on 15.06.23.
//

import UIKit

final class RepositoryDetailViewModel: BaseViewModel {
  private let repository: Repository

  var language: String? { repository.language }
  var forksCount: String { "\(repository.forksCount)" }
  var creationDate: String { repository.createdAt }
  var githubLink: URL? { URL(string: repository.htmlUrl) }
  var gitHubPageLinkAttributedString: NSAttributedString { createGitHubPageLinkAttributedString() }

  init(repository: Repository) {
    self.repository = repository
  }

  private func createGitHubPageLinkAttributedString() -> NSAttributedString {
    let string = "GitHub page of the repository"
    let attributedString = NSMutableAttributedString(string: string)
    let linkAttributes: [NSAttributedString.Key: Any] = [
      .link: URL(string: repository.htmlUrl)!,
        .foregroundColor: UIColor.blue,
        .underlineStyle: NSUnderlineStyle.single.rawValue
    ]
    attributedString.addAttributes(linkAttributes, range: NSRange(location: 0, length: string.count))

    return attributedString

  }
}

extension RepositoryDetailViewModel: RepositoryDetailViewModeling {
  
}
