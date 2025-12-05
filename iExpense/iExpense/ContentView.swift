//
//  ContentView.swift
//  iExpense
//
//  Created by Harsh on 08/10/24.
//

import Observation
import SwiftUI
//
//struct ContentView: View {
//    @State private var user = User()
//
//    var body: some View {
//        VStack {
//            Text("Your name is \(user.firstName) \(user.lastName).")
//
//            TextField("First name", text: $user.firstName)
//            TextField("Last name", text: $user.lastName)
//        }
//    }
//}
//
//#Preview {
//    ContentView()
//}
//
//@Observable
//class User {
//    var firstName = "Bilbo"
//    var lastName = "Baggins"
//}

//struct ContentView: View {
//    @State private var showingSheet = false
//
//    var body: some View {
//        Button("Show Sheet") {
//            showingSheet.toggle()
//        }
//        .sheet(isPresented: $showingSheet) {
//            SecondView(name: "harsh")
//        }
//    }
//}
//
//struct SecondView: View {
//    let name: String
//    
//    @Environment(\.dismiss) var dismiss
//    
//    var body: some View {
//        Button("Dismiss") {
//            dismiss()
//        }
//    }
//}

//struct ContentView: View {
//    @State private var numbers = [Int]()
//    @State private var currentNumber = 1
//
//    var body: some View {
//        NavigationStack {
//            VStack {
//                List {
//                    ForEach(numbers, id: \.self) {
//                        Text("Row \($0)")
//                    }
//                    .onDelete(perform: removeRows)
//                }
//                
//                Button("Add Number") {
//                    numbers.append(currentNumber)
//                    currentNumber += 1
//                }
//            }
//            .toolbar{
//                EditButton()
//            }
//        }
//    }
//    func removeRows(at offsets: IndexSet) {
//        numbers.remove(atOffsets: offsets)
//    }
//}

struct ContentView: View {
    
    @State private var expenses = Expenses()
    @State private var showingAddExpense = false
    @State private var path = NavigationPath()
    
    var body: some View {
        NavigationStack(path: $path) {
            List {
                ForEach(expenses.items) { item in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(item.name)
                                .font(.headline)
                            Text(item.type)
                        }

                        Spacer()
                        Text(item.amount, format: .currency(code: "USD"))
                    }
                }
                .onDelete(perform: removeItems)
            }
            .toolbar {
                NavigationLink {
                    AddView(path: $path, expenses:expenses)
                } label: {
                    Button("Add Expense", systemImage: "plus") {
                        path.append(1)
                    }
                }
            }
            .navigationTitle("iExpense")
        }
//        .sheet(isPresented: $showingAddExpense) {
//            // show an AddView here
//            AddView(expenses:expenses)
//        }
    }
    func removeItems(at offsets: IndexSet) {
        expenses.items.remove(atOffsets: offsets)
    }
}

struct ExpenseItem : Identifiable, Codable {
    var id = UUID()
    let name: String
    let type: String
    let amount: Double
}

@Observable
class Expenses {
    var items = [ExpenseItem](){
        didSet {
            if let encoded = try? JSONEncoder().encode(items) {
                UserDefaults.standard.set(encoded, forKey: "Items")
            }
        }
    }
    
    init() {
        if let savedItems = UserDefaults.standard.data(forKey: "Items") {
            if let decodedItems = try? JSONDecoder().decode([ExpenseItem].self, from: savedItems) {
                items = decodedItems
                return
            }
        }

        items = []
    }
}

#Preview {
    ContentView()
}
