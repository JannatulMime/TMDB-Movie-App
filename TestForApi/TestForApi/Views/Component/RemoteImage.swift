//
//  RemoteImage.swift
//  TestForApi
//
//  Created by Habibur Rahman on 17/7/24.
//
//
import Kingfisher
import SwiftUI

struct RemoteImage: View {
    let imagePath: String

    var body: some View {
        ZStack {
            if let url = URL(string: imagePath) {
                KFImage(url)
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
//        Image("sky")
//            .resizable()
//        .aspectRatio(contentMode: .fill)
//        .ignoresSafeArea()
       // .clipped()
        
    }
}

#Preview {
    RemoteImage(imagePath: "https://image.tmdb.org/t/p/original//gKkl37BQuKTanygYQG1pyYgLVgf.jpg")
}
