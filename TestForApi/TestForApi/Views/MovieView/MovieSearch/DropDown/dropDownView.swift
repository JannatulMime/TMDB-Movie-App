//
//  dropDownView.swift
//  TestForApi
//
//  Created by Habibur Rahman on 10/9/24.
//

import SwiftUI

enum ItemTypes: String, CaseIterable {
    case Movie
    case TvSeries = "Tv Series"
}

struct dropDownView: View {
  
    @Binding var selection: ItemTypes

    var body: some View {
        VStack {
            Picker("Select", selection: $selection) {
                ForEach(ItemTypes.allCases, id: \.self) { option in
                    Text(option.rawValue)
                       
                }
            }

            .pickerStyle(.menu)
        }
        
    }
}

#Preview {
    dropDownView(selection: .constant(.Movie))
}
