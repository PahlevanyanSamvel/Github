//
//  UserDTO.swift
//  Github
//
//  Created by Samvel Pahlevanyan on 15.06.23.
//

import Foundation

struct UserDTO: Codable, DomainConvertible {
  var login: String
  var avatarUrl: String

  enum CodingKeys: String, CodingKey {
    case login
    case avatarUrl = "avatar_url"
  }

  func toDomain() -> User {
    .init(login: login, avatarUrl: avatarUrl)
  }
}
