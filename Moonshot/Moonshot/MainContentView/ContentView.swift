//
//  ContentView.swift
//  Moonshot
//
//  Created by Harsh on 19/12/24.
//

import SwiftUI

struct ContentView: View {
    @State private var missionViewType: MissionListType = .grid
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    
    var body: some View {
        NavigationStack {
            Group {
                if missionViewType == .grid {
                    MissionGridView(missions: missions, astronauts: astronauts)
                } else {
                    MissionListView(missions: missions, astronauts: astronauts)
                }
            }
            
            .toolbar {
                Button(missionViewType == .grid ? "List" : "Grid") {
                    missionViewType = missionViewType == .grid ? .list : .grid
                }
            }
            .navigationTitle("Moonshot")
            .background(.darkBackground)
            .preferredColorScheme(.dark)
        }
    }
    
    enum MissionListType {
        case grid
        case list
    }
}

#Preview {
    ContentView()
}


