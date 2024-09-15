//
//  SearchListView.swift
//  TestForApi
//
//  Created by Habibur Rahman on 12/7/24.
//

import SwiftUI


struct SingleSearchListItemView: View {
    let name: String
    let posterPath : String
    
    var body: some View {
        HStack {
            
            RemoteImage(imagePath: posterPath)
                .frame(width: 50, height: 50)
                .cornerRadius(10)
            
            
            Text(name)
                .font(.headline)
                .fontWeight(.bold)
                .foregroundStyle(.white)
                .padding()
                .multilineTextAlignment(.leading)
            
            Spacer()
        } .padding()
    }
}

#Preview {
    SingleSearchListItemView(name: "Furious", posterPath: "https://image.tmdb.org/t/p/original//iADOJ8Zymht2JPMoy3R7xceZprc.jpg")
}
