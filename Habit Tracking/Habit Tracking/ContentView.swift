import SwiftUI





// MARK: - Views
struct ContentView: View {
    @StateObject var habits = Habits()
    @State private var showingAddHabit = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(habits.items) { habit in
                    NavigationLink(destination: HabitDetailView(habits: habits, habit: habit)) {
                        HStack {
                            VStack(alignment: .leading) {
                                Text(habit.name)
                                    .font(.headline)
                                Text(habit.description)
                                    .font(.subheadline)
                                    .lineLimit(1)
                                    .foregroundColor(.secondary)
                            }
                            Spacer()
                            Text("\(habit.count)")
                        }
                    }
                }
                .onDelete(perform: removeItems)
            }
            .navigationTitle("Habits")
            .toolbar {
                Button {
                    showingAddHabit = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $showingAddHabit) {
                AddHabitView(habits: habits)
            }
        }
    }
    
    func removeItems(at offsets: IndexSet) {
        habits.items.remove(atOffsets: offsets)
    }
}
