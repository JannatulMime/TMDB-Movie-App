//
//  TextInCapsuleBG.swift
//  TestForApi
//
//  Created by Habibur Rahman on 29/8/24.
//

import SwiftUI

struct TextInCapsuleBG: View {
    var text: String

    var body: some View {
//        Capsule()
//            .fill(Color.blueis)
//            .frame(width: 70, height: 27)
//            .overlay(
//                Text(text)
//                    .font(.caption)
//                    .foregroundStyle(.blue)
//                  //  .padding()
//            )
        ////            .onTapGesture {
        ////              // onSeriesItemPressed(genra)
        ////            }

        Text(text)
            .font(.caption)
            .fontWeight(.bold)
            .foregroundStyle(.teal)
            .frame(height: 8)
            .padding(10)
            .background(.blueis)
            .clipShape(RoundedRectangle(cornerRadius: 15))
    }
}

#Preview {
    TextInCapsuleBG(text: "Secince Fiction")
}
