//
//  CustomSearchView.swift
//  TestForApi
//
//  Created by Habibur Rahman on 8/9/24.
//

import SwiftUI

struct CustomSearchView: View {

    @Binding var searchText : String
  //  @State private var showCancelButton: Bool = false
    
    
    var body: some View {
       
            HStack{
                HStack (spacing:0){
                    Image(systemName: "magnifyingglass")
                        .resizable()
                        .frame(width: 20, height: 20)
                        .padding(.horizontal)
                    
                    
                    TextField("Search", text: $searchText)
                    // Spacer()
                    //                Button(action: {
                    //                    searchText = ""
                    //                }) {
                    //                    Image(systemName: "xmark.circle.fill").opacity(searchText == "" ? 0 : 1)
                    //                }
                }
                .padding(8)
                .foregroundColor(.gray)
                .background(Color.gray.opacity(0.2))
                .cornerRadius(10)
                
            }.frame(maxWidth: .infinity)
      
    }
}

#Preview {
    CustomSearchView(searchText: .constant(""))
}

//
//VStack( alignment: .leading ,spacing: 0) {
//    Text("Search")
//        .font(.largeTitle)
//        .fontWeight(.heavy)
//}
//   
