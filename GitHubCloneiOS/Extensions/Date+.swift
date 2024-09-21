//
//  Date+.swift
//  GitHubCloneiOS
//
//  Created by Clement Skosana on 2024/09/21.
//

import Foundation

extension Date {
    static func timeAgo(from dateString: String) -> String {
        let dateFormatter = ISO8601DateFormatter()
        let date = dateFormatter.date(from: dateString) ?? Date.distantPast
        let relativeDateFormater = RelativeDateTimeFormatter()
        relativeDateFormater.unitsStyle = .short
        return relativeDateFormater.localizedString(for: date, relativeTo: Date.now)
    }
}
