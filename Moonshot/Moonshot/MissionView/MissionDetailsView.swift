//
//  MissionDetailsView.swift
//  Moonshot
//
//  Created by Harshvardhan on 01/04/25.
//

import SwiftUI

struct MissionDetailsView: View {
    var mission : Mission
    var body: some View {
        VStack(alignment: .leading) {
            DividerView()
            Text("Mission Highlights")
                .font(.title.bold())
                .padding(.bottom, 5)
            
            HStack {
                Text("Launch Date:")
                    .font(.subheadline.bold())
                Spacer()
                Text(mission.formattedLaunchDate)
                    .font(.footnote.bold())
            }
            .padding(.bottom, 5)
            
            Text(mission.description)
            DividerView()
            
            Text("Crew")
                .font(.title.bold())
                .padding(.bottom, 5)
        }
    }
}

#Preview {
    let missions: [Mission] = Bundle.main.decode("missions.json")
    MissionDetailsView(mission: missions[0])
}
