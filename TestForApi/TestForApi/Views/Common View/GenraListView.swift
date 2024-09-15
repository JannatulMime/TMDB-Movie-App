//
//  GenraListView.swift
//  TestForApi
//
//  Created by Habibur Rahman on 29/8/24.
//

import SwiftUI

struct GenraListView: View {
    
    var genras : [Genre] = []
   
    
    var body: some View {
        HStack(spacing: 10) {
            ForEach(genras) { genra in
                TextInCapsuleBG(text: genra.name ?? "")
//                    .onTapGesture {
//                       onMovieItemPressed(genra)
//                    }
//
            }
        }
    }
}

#Preview {
    GenraListView()
}
