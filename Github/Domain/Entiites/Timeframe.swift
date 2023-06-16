//
//  Timeframe.swift
//  Github
//
//  Created by Samvel Pahlevanyan on 15.06.23.
//

import Foundation

enum Timeframe: Int {

  case lastDay = 0
  case lastWeek = 1
  case lastMonth = 2

  var stringDateFrame: String {
    let calendar = Calendar.current
    let date: Date?

    switch self {
    case .lastDay:
      date = calendar.date(byAdding: .day, value: -1, to: Date())
    case .lastWeek:
      date = calendar.date(byAdding: .weekOfYear, value: -1, to: Date())
    case .lastMonth:
      date = calendar.date(byAdding: .month, value: -1, to: Date())
    }

    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd"
    return dateFormatter.string(from: date ?? Date())
  }
}
