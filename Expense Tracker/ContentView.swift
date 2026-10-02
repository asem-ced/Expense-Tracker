//
//  ContentView.swift
//  Expense Tracker
//
//  Created by Andrei Semenov on 10/1/26.
//

import SwiftUI

struct ContentView: View {
    @State private var viewModel = ExpenseViewModel()
    var body: some View {
        ZStack {
            backgroundGradient
            VStack(spacing: 14) {
                titleText
                summaryRow
                if viewModel.isOverBudget {
                    warningBanner
                }
                expenseList
                addButtons
                budgetButtons
            }
            .padding()
        }
    }
    
    private var backgroundGradient: some View {
        LinearGradient(colors: [.cyan, .green], startPoint: .topLeading, endPoint: .bottomTrailing)
        opacity(0.8)
            .ignoresSafeArea()
    }
    
    private var titleText: some View {
        Text("Expense Tracker")
            .font(.largeTitle)
            .fontWeight(.bold)
            .foregroundStyle(.white)
            .shadow(radius: 3)
    }
    
    private var summaryRow: some View {
        HStack(spacing: 12) {
            summaryCard(label: "Budget", amount: viewModel.budget, color: .blue);
            summaryCard(label: "Spent", amount: viewModel.totalSpent, color: .orange);
            summaryCard(label: "Remaining", amount: viewModel.remaining, color: viewModel.isOverBudget ? .red : .green)
            
        }
    }
    
    private func summaryCard(label: String, amount: Double, color: Color) -> some View {
        VStack(spacing: 4) {
            Text(label)
                .font(.subheadline)
                .foregroundStyle(.secondary)
            Text("$\(amount, specifier: "%.2f")")
                .font(.headline)
                .foregroundStyle(color)
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 12)
        .background(.white, in: RoundedRectangle(cornerRadius: 16))
    }
    
    private var warningBanner: some View {
        Text("YOU ARE OVER BUDGET!")
            .font(.headline)
            .foregroundStyle(.white)
            .frame(maxWidth: .infinity)
            .padding()
            .background(.red, in: RoundedRectangle(cornerRadius: 16))
    }
    
    private var expenseList: some View {
        ScrollView {
            VStack(spacing: 10) {
                ForEach(viewModel.expenses) {
                    expense in ExpenseRow(
                        emoji: expense.category.emoji, title: expense.title, amount: expense.amount, isBigTicket: expense.isBigTicket, color: viewModel.color(for: expense.category)
                    )
                    .onTapGesture {
                        viewModel.removeExpense(expense)
                    }
                }
                
            }
        }
    }
    
    private var addButtons: some View {
        
    }
    
    
    
}

#Preview {
    ContentView()
}
