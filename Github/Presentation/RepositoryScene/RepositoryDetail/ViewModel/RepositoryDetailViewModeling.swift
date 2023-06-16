//
//  RepositoryDetailViewModelling.swift
//  Github
//
//  Created by Samvel Pahlevanyan on 15.06.23.
//

import Foundation

protocol RepositoryDetailViewModeling: BaseViewModeling {
  var language: String? { get }
  var forksCount: String { get }
  var creationDate: String { get }
  var githubLink: URL? { get }
  var gitHubPageLinkAttributedString: NSAttributedString { get }
}
