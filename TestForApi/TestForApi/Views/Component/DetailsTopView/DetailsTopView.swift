//
//  DetailsTopView.swift
//  TestForApi
//
//  Created by Habibur Rahman on 15/9/24.
//

import SwiftUI

struct DetailsTopView: View {
    
    @Binding var imagePath : String
    
    var topEdge : CGFloat
    @Binding var offset : CGFloat
    
    var body: some View {
    
        ZStack(alignment: .topLeading) {
            RemoteImage(imagePath: imagePath)
                .clipShape(Rectangle())
                .frame(width: UIScreen.main.bounds.width)
                .scaledToFill()

            LinearGradient(
                gradient: Gradient(colors: [Color.clear, Color.black.opacity(0.5)]),
                startPoint: .bottom,
                endPoint: .top
            ).frame(width: UIScreen.main.bounds.width)
        }
        .background(Color.black)
        .opacity(getOpacity())
        .clipShape(CustomCorner(corners: [.bottomRight], radius: getCornerRadius()))
    }
    
    func getOpacity() -> CGFloat {
        
       
        let progress = -offset / 230//70
        let opacity = 1 - progress
        
        return offset < 0 ? opacity : 1
    }
    
    func getCornerRadius() -> CGFloat {
        let progress = -offset / (350 - (100 + topEdge))
        let value = 1 - progress
        let radius = value * 80
        return offset < 0 ? radius : 80
    }
}

#Preview {
    DetailsTopView(
        imagePath: .constant(Utility.getWebImagePath(imageName: "https://image.tmdb.org/t/p/original/kUWvvMkNIf21UUDmHjYw55v6o7C.jpg")),
        topEdge: 0,
        offset: .constant(0)
        //,maxHeight: 500
    )
}
