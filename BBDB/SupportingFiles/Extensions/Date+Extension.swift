//
//  Date+Extension.swift
//  BBDB
//
//  Created by Илья Валито on 13.02.2025.
//

import Foundation

extension Date {
    static func convertStringToDate(_ dateString: String) -> Date {
        let formatter = ISO8601DateFormatter()
        if let parsedDate = formatter.date(from: dateString) {
            return parsedDate
        } else {
            return Date.distantPast
        }
    }
    
    func convertDateToString() -> String {
        let formatter = ISO8601DateFormatter()
        return formatter.string(from: self)
    }
}

