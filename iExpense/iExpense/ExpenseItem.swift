//
//  ExpenseItem.swift
//  iExpense
//
//  Created by Jake Quinter on 1/21/23.
//

import Foundation

struct ExpenseItem: Identifiable, Codable {
    var id = UUID()
    let name: String
    let type: String
    let amount: Double
}
