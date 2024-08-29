//
//  TextInCapsuleBG.swift
//  TestForApi
//
//  Created by Habibur Rahman on 29/8/24.
//

import SwiftUI

struct TextInCapsuleBG: View {
    
    var text : String
    
    var body: some View {
        Capsule()
            .fill(Color.blueis)
            .frame(width: 70, height: 27)
            .overlay(
                Text(text)
            )
            .onTapGesture {
              // onSeriesItemPressed(genra)
            } .font(.caption)
            .foregroundStyle(.blue)
    }
}

#Preview {
    TextInCapsuleBG(text: "Action")
}
