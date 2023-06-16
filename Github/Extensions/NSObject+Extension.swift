//
//  NSObject+Extension.swift
//  Github
//
//  Created by Samvel Pahlevanyan on 14.06.23.
//

import Foundation

public extension NSObject {
  class var className: String {
    return String(describing: self.self)
  }
}
