//
//  CustomSheet.swift
//  TestForApi
//
//  Created by Habibur Rahman on 9/8/24.
//

import SwiftUI

struct ImdbButton: View {
  
    @Binding var imdbId : String?
    @State private var showSheet: Bool = false
   
    var body: some View {
        Button(action: {
            showSheet.toggle()
            
        }, label: {
           Rectangle()
                    .fill(Color.pinkk)
                    .frame(width: 50, height: 20)
                    .cornerRadius(5)
                    .overlay(
                        Text("IMBD")
                            .font(.caption2)
                            .foregroundStyle(.red)
                    )
        })
        .sheet(isPresented: $showSheet)  {
            if let imdbUrl = getImdbUrl(id: imdbId) {
                CustomWebView(url: imdbUrl)
                    .presentationDetents([ .large])
            }else{
              //debugPrint("No Url")
            }
          
//                .presentationDetents([.fraction(0.1), .height(300), .medium, .large])
               
               // .presentationDragIndicator(.hidden)
        }
    }
    
    func getImdbUrl(id: String?) -> URL? {
        guard let id = id, id != "" else {
            return nil
        }
        let path = "https://www.imdb.com/title/\(id)"
        print( "U>> imdb Path \(path)")
        return URL(string: path)
       // return id
    }
}

#Preview {
    ImdbButton(imdbId: .constant("tt12037194"))
}
