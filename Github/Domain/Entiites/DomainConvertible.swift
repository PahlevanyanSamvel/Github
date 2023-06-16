//
//  DomainConvertible.swift
//  Github
//
//  Created by Samvel Pahlevanyan on 15.06.23.
//

import Foundation

protocol DomainConvertible {
  associatedtype DomainModel
  func toDomain() -> DomainModel
}

extension Array where Element: DomainConvertible {
  func toDomain() -> [Element.DomainModel] {
    map { $0.toDomain() }
  }
}
