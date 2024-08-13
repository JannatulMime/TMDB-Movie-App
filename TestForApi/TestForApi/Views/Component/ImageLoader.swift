//
//  ImageLoader.swift
//  TestForApi
//
//  Created by Habibur Rahman on 30/6/24.
//

import SwiftUI

struct ImageLoader: View {
    var body: some View {
        Image(systemName: "person.fill")
            .data(url: URL(string: "https://image.tmdb.org/t/p/original/vpnVM9B6NMmQpWeZvzLvDESb2QY.jpg")!)
               // .scaleEffect()
    }
}

#Preview {
    ImageLoader()
}
                  
             
extension Image {
   func data (url: URL) -> Self {
      if let data = try? Data(contentsOf: url) {
        return Image(uiImage: UIImage(data: data)!)
            .resizable()
    }
   
     return self
        .resizable()
    
   }
}
