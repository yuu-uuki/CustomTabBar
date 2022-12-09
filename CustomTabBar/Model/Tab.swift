//
//  Tab.swift
//  CustomTabBar
//
//  Created by yuki.tanaka on 2022/12/09.
//

import Foundation

enum Tab: CaseIterable {
    case home
    case search
    case ranking
    case book
    case setting
}
// MARK: - SF Symbols Name
extension Tab {
    func symbolName() -> String {
        switch self {
        case .home:
            return "house"
        case .search:
            return "magnifyingglass"
        case .ranking:
            return "crown"
        case .book:
            return "book"
        case .setting:
            return "gearshape"
        }
    }
}
