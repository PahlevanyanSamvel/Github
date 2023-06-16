//
//  URLService.swift
//  Github
//
//  Created by Samvel Pahlevanyan on 14.06.23.
//

import Foundation

class URLService {
  //MARK: - Private properties
  private let request: APIRequest!

  //MARK: - Init
  init(request: APIRequest) {
    self.request = request
  }

  //MARK: - Public properties
  var url: URL {
    var component = URLComponents()
    component.scheme = "https"
    component.host = request.urlConfig.baseUrl
    var pathValue = ""
    request.pathComponents?.forEach({pathValue = pathValue + "/\($0)"})
    component.path = request.urlConfig.path + pathValue
    component.queryItems = getQueryParameters(request.parameters)
    return component.url!
  }

  var urlRequest: URLRequest {
    var urlRequest = URLRequest(url: url)
    urlRequest.httpBody = request.data
    urlRequest.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
    urlRequest.httpMethod = request.method.rawValue
    return urlRequest
  }

  private func getQueryParameters(_ parameters: [String: Any?]?) -> [URLQueryItem] {
    var queries = [URLQueryItem]()
    if let values = parameters {
      values.forEach { (key, value) in

        if let value = value {

          if let array = value as? [String] {
            array.forEach {
              let query = URLQueryItem(name: key, value: "\($0)")
              queries.append(query)
            }
          } else {
            let query = URLQueryItem(name: key, value: "\(value)")
            queries.append(query)
          }
        }
      }
    }
    return queries
  }
}

