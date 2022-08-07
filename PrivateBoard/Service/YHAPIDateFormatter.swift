//
//  YHAPIDateFormatter.swift
//  PrivateBoard
//
//  Created by WG Yang on 2022/08/03.
//

import Foundation

class YHAPIDateFormatter {
    static func string(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
        return formatter.string(from: date)
    }
    static func date(string: String) -> Date? {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
        return formatter.date(from: string)
    }
}
