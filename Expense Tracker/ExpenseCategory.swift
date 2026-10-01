//
//  ExpenseCategory.swift
//  Expense Tracker
//
//  Created by Andrei Semenov on 10/1/26.
//

import Foundation

enum ExpenseCategory {
    case food, transportation, entertainment, shopping
    
    var emoji: String {
        switch self {
        case .food: "🌭"
        case.transportation: "🚗"
        case .entertainment: "🎮"
        case .shopping: "🛒"
        }
    }
}
