//
//  ExpenseRow.swift
//  Expense Tracker
//
//  Created by Andrei Semenov on 10/1/26.
//

import SwiftUI

struct ExpenseRow: View {
    let emoji: String
    let title: String
    let amount: Double
    let isBigTicket: Bool
    let color: Color
    
    var body: some View {
        HStack(spacing: 12) {
            emojiBadge
            Text(title)
                .font(.title3)
            if isBigTicket {
                bigTicketTag
            }
            Spacer()
            Text("$\(amount, specifier: "%.2f")")
                .font(.title3)
                .fontWeight(.bold)
                .foregroundStyle(color)
        }
        padding(14)
            .background(.white, in: RoundedRectangle(cornerRadius: 16))
            .shadow(color: .black.opacity(0.15), radius: 5, y: 3)
    }
    
    private var emojiBadge: some View {
        Text(emoji)
            .font(.title)
            .frame(width: 52, height: 52)
            .background(color.opacity(0.2), in: Circle())
    }
    
    private var bigTicketTag: some View {
        Text("BIG")
            .font(.caption)
            .fontWeight(.heavy)
            .foregroundStyle(.white)
            .padding(.horizontal, 8)
            .padding(.vertical, 3)
            .background(.red, in: Capsule())
    }
}

#Preview {
    ExpenseRow(emoji: "🎬", title: "Movie Tickets", amount: 25, isBigTicket: false, color: .purple)
        .padding()
}
