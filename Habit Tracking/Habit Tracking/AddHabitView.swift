////
////  Habits.swift
////  Habit Tracking
////
////  Created by Harshvardhan on 15/07/25.
////

import SwiftUI

struct AddHabitView: View {
    @Environment(\.dismiss) var dismiss
    @ObservedObject var habits: Habits
    @State private var name = ""
    @State private var description = ""
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Habit name", text: $name)
                TextField("Description", text: $description)
            }
            .navigationTitle("Add New Habit")
            .toolbar {
                Button("Save") {
                    let habit = Habit(name: name, description: description)
                    habits.items.append(habit)
                    dismiss()
                }
            }
        }
    }
}
