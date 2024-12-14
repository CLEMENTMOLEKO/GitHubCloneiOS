//
//  EditStatusViewModel.swift
//  GitHubCloneiOS
//
//  Created by Clement Skosana on 2024/12/14.
//
import Foundation
import Observation

enum ClearAfter: Identifiable, CaseIterable {
    case never
    case thirtyminutes
    case onehour
    case fourhours
    case today
    case thisweek
    
    var id: Self { self }
    
    var text: String {
        switch self {
        case .never:
            "Never"
        case .thirtyminutes:
            "30 minutes"
        case .onehour:
            "1 hour"
        case .fourhours:
            "4 hours"
        case .today:
            "Today"
        case .thisweek:
            "This week"
        }
    }
}

@Observable
final class EditStatusViewModel {
    var statusMessage: String = ""
    var isBusy: Bool = false
    var clearAfter: ClearAfter = .never
}
