//
//  HabitDetailView.swift
//  Habit Tracking
//
//  Created by Harsh vardhan singh shekhawat on 21/08/25.
//

import SwiftUI

struct HabitDetailView: View {
    @ObservedObject var habits: Habits
    var habit: Habit
    
    var habitIndex: Int? {
        habits.items.firstIndex { $0.id == habit.id }
    }
    
    var body: some View {
        VStack(spacing: 20) {
            Text(habit.description)
                .font(.title2)
                .padding()
            
            if let index = habitIndex {
                Text("Completed \(habits.items[index].count) times")
                    .font(.headline)
                
                Button("Mark as Completed") {
                    habits.items[index].count += 1
                }
                .buttonStyle(.borderedProminent)
            }
            
            Spacer()
        }
        .navigationTitle(habit.name)
        .padding()
    }
}
