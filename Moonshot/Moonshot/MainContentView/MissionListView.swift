//
//  MissionListView.swift
//  Moonshot
//
//  Created by Harshvardhan on 01/04/25.
//

import SwiftUI

struct MissionListView: View {
    
    let missions: [Mission]
    let astronauts: [String: Astronaut]
    
    var body: some View {
        HStack {
            List {
                ForEach(missions) { mission in
                    NavigationLink {
                        MissionView(mission: mission, astronauts: astronauts)
                    }label: {
                        Image(mission.image)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 50, height: 50)
                            .padding(10)
                            Text(mission.displayName)
                                .font(.headline)
                                .foregroundStyle(.white)
                        
                                .padding(.horizontal)
                        
                            Text(mission.formattedLaunchDate)
                                .font(.caption)
                                .foregroundStyle(.white.opacity(0.5))
                    }
                    .clipShape(.rect(cornerRadius: 10))
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(.lightBackground)
                            .padding(.horizontal, -10)
                    )
                    }
                }
            }
    }
}

#Preview {
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    MissionListView(missions: missions, astronauts: astronauts)
}
