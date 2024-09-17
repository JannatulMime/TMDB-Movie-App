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
        VStack(alignment: .center, spacing: 3) {
            
            RemoteImage(imagePath: profilePath)
                .frame(width: 70, height: 70)
                .clipShape(Circle())
                .padding(.top,10)
                .padding(.horizontal,10)
                
                
            
            Text(name)
                .font(.caption2)
                .foregroundStyle(.teal)
                .multilineTextAlignment(.center)
                .frame(height: 40)
                .padding(.bottom,5)
                .padding(.horizontal,10)
            
        }.frame(width: 100)
            .background(RoundedRectangle(cornerRadius: 10).fill(.white)
                .shadow(color: .yellow, radius: 10)
            )
            .padding(15)
            
    }
}

#Preview {
    CastView(name: "Anya Taylor-Joy", profilePath: "https://image.tmdb.org/t/p/original/jxAbDJWvz4p1hoFpJYG5vY2dQmq.jpg")
}
