//
//  CastView.swift
//  TestForApi
//
//  Created by Habibur Rahman on 9/7/24.
//

import SwiftUI

struct CastView: View {

    let name: String
    let profilePath: String
    
    init(name: String, profilePath: String) {
        self.name = name
        self.profilePath = profilePath
    }

    
    var body: some View {
        VStack(alignment: .leading, spacing: 3) {
            
            RemoteImage(imagePath: profilePath)
                .clipShape(Circle())
                .frame(width: 100, height: 100)
                
            
            Text(name)
                .font(.caption2)
                .padding(.horizontal)
                .lineLimit(1)
              
        }
    }
}

#Preview {
    CastView(name: "Anya Taylor-Joy", profilePath: "https://image.tmdb.org/t/p/original/jxAbDJWvz4p1hoFpJYG5vY2dQmq.jpg")
}
