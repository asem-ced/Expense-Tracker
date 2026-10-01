//
//  ExpenseViewModel.swift
//  Expense Tracker
//
//  Created by Andrei Semenov on 10/1/26.
//

import SwiftUI

@Observable
class ExpenseViewModel {
    private(set) var expenses: [Expense] = [
        Expense(title: "Chickfila", amount: 27.30, category: .food)
        Expense(title: "Gas", amount: 50.00, category: .transportation)
        Expense(title: "Ps5", amount: 500.00, category: .entertainment)
        Expense(title: "MtDew", amount: 12.00, category: .food)
        Expense(title: "Netflix", amount: 18.99, category: .entertainment)
    ]
    
    var budget: Double = 500 {
        didSet {
            if budget < 0 {
                budget = 0
            }
        }
    }
    
    var totalSpent: Double {
        var total = 0.0
        for expense in expenses {
            total += expense.amount
        }
        return total
    }
    var remaining: Double {
        budget - totalSpent
    }
    
    var isOverBudget: Bool {
        totalSpent > budget
    }
    
    func adjustBudget(by amount: Double) {
        budget += amount
    }
    
    func addExpense(title: String, amount: Double, category: ExpenseCategory) {
        expenses.append(Expense(title: title, amount: amount, category: category))
    }
    
    func removeExpense(_ expense: Expense) {
        for index in expenses.indices where 
    }
}
