//
//  ImageContentView.swift
//  CupcakeCorner
//
//  Created by Harsh vardhan singh shekhawat on 28/08/25.
//

import SwiftUI

struct ImageContentView: View {
    var body: some View {
        //        AsyncImage(url: URL(string: "https://hws.dev/img/logo.png"))
        //            .frame(width: 200, height: 200)
        //        AsyncImage(url: URL(string: "https://hws.dev/img/logo.png")) { image in
        //            image
        //                .resizable()
        //                .scaledToFit()
        //        } placeholder: {
        //            Color.red
        //        }
        //        .frame(width: 200, height: 200)
                AsyncImage(url: URL(string: "https://hws.dev/img/bad.png")) { phase in
                    if let image = phase.image {
                        image
                            .resizable()
                            .scaledToFit()
                    } else if phase.error != nil {
                        Text("There was an error loading the image.")
                    } else {
                        ProgressView()
                    }
                }
                .frame(width: 200, height: 200)
    }
}

#Preview {
    ImageContentView()
}
