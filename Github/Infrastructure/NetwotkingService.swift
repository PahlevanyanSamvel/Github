//
//  NetwotkingService.swift
//  Github
//
//  Created by Samvel Pahlevanyan on 14.06.23.
//

import Foundation

class NetwotkingService: Netwotking {
  func request(request: APIRequest) async -> Response<Data> {
    do {
      let urlRequest = URLService(request: request).urlRequest
      let (data, _) = try await URLSession.shared.data(for: urlRequest)
      return .success(data)
    } catch {
      return .failure(error)
    }
  }
}
