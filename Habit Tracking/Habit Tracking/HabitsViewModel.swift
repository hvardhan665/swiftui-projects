//
//  HabitsViewModel.swift
//  Habit Tracking
//
//  Created by Harsh vardhan singh shekhawat on 21/08/25.
//

import Foundation
// MARK: - ViewModel
class Habits: ObservableObject {
    @Published var items: [Habit] {
        didSet {
            saveItems()
        }
    }
    
    let saveKey = "HabitsData"
    
    init() {
        if let data = UserDefaults.standard.data(forKey: saveKey) {
            let decoder = JSONDecoder()
            if let decoded = try? decoder.decode([Habit].self, from: data) {
                self.items = decoded
                return
            }
        }
        self.items = []
    }
    
    func saveItems() {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(items) {
            UserDefaults.standard.set(encoded, forKey: saveKey)
        }
    }
}
