//
//  RemoteImage.swift
//  TestForApi
//
//  Created by Habibur Rahman on 17/7/24.
//
//
import Kingfisher
import SwiftUI

import Kingfisher



struct RemoteImage: View {
    let imagePath: String

    var body: some View {
        ZStack {
            if let url = URL(string: imagePath) {
                KFImage(url)
                    .loadDiskFileSynchronously()
                    .cacheMemoryOnly(false)
                    .fade(duration: 0.25)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .clipped()

            } else {
                Image("sky")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .clipped()
            }
        }

        
    }
}

#Preview {
    RemoteImage(imagePath: "https://image.tmdb.org/t/p/original//gKkl37BQuKTanygYQG1pyYgLVgf.jpg")
}
