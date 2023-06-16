//
//  TrandingRepositoryListApiDataSource.swift
//  Github
//
//  Created by Samvel Pahlevanyan on 14.06.23.
//

import Foundation

class TrandingRepositoryListApiDataSource {
  private let netwotking: Netwotking

  init(netwotking: Netwotking) {
    self.netwotking = netwotking
  }

  func fetchTrandingRepositoruList(page: Int, timeframe: String) async -> Result<TrendingReposResponseDTO, Error> {
    let result = await netwotking.request(request: .init(urlConfig: .init(path: "/search/repositories"),
                                                         parameters: ["q": "created:\(timeframe)",
                                                                      "page": page,
                                                                      "sort": "stars",
                                                                      "order": "desc"],
                                                         method: .get))
    switch result {
    case .failure(let error):
      return .failure(error)
    case .success(let data):
      do {
        return .success(try JSONDecoder().decode(TrendingReposResponseDTO.self, from: data))
      } catch {
        return .failure(error)
      }
    }
  }
}
