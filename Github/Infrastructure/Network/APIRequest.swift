//
//  APIRequest.swift
//  Github
//
//  Created by Samvel Pahlevanyan on 14.06.23.
//

import Foundation

struct APIRequest {
  //MARK: - Properties
  var urlConfig: UrlConfig
  var data: Data?
  var parameters: [String: Any?]?
  let method: RequestMethod
  var headers: [String: String]?
  var pathComponents: [String]?

  //MARK: - Init
  public init(urlConfig: UrlConfig,
              data: Data? = nil,
              parameters: [String: Any?]? = nil,
              method: RequestMethod,
              headers: [String: String]? = nil) {
    self.urlConfig = urlConfig
    self.data = data
    self.parameters = parameters
    self.method = method
    self.headers =  headers
  }

  //MARK: - Enums
  public enum RequestMethod: String {
    case get     = "GET"
    case post    = "POST"
    case put     = "PUT"
    case delete  = "DELETE"
    case patch   = "PATCH"
  }
}
