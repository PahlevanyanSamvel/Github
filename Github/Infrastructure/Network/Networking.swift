//
//  Networking.swift
//  Github
//
//  Created by Samvel Pahlevanyan on 14.06.23.
//

import Foundation

protocol Netwotking {
  func request(request: APIRequest) async -> Response<Data>
}

enum Response<T> {
  case success(T)
  case failure(Error)
}
