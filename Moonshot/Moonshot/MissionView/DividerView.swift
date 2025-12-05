//
//  DividerView.swift
//  Moonshot
//
//  Created by Harshvardhan on 01/04/25.
//

import SwiftUI

struct DividerView: View {
    var body: some View {
        Rectangle()
            .frame(height: 2)
            .foregroundStyle(.lightBackground)
            .padding(.vertical)
    }
}

#Preview {
    DividerView()
}
