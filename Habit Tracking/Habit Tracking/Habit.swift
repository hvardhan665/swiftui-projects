////
////  Habits.swift
////  Habit Tracking
////
////  Created by Harshvardhan on 15/07/25.
////
///
import SwiftUI

// MARK: - Model
struct Habit: Identifiable, Codable {
    let id: UUID
    var name: String
    var description: String
    var count: Int
    
    init(id: UUID = UUID(), name: String, description: String, count: Int = 0) {
        self.id = id
        self.name = name
        self.description = description
        self.count = count
    }
}
