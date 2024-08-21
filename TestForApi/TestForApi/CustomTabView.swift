//
//  CustomTabView.swift
//  TestForApi
//
//  Created by Habibur Rahman on 19/8/24.
//

import SwiftUI

struct CustomTabView: View {
    @State var index = 0
    
    var body: some View {
        VStack(spacing: 0) {
            
            ZStack {
                
                if self.index == 0 {
                   // Color.black.opacity(0.05).edgesIgnoringSafeArea(.top)
                    MovieListView()
                }
                else if self.index == 1 {
                    
                   // Color.red.edgesIgnoringSafeArea(.top)
                    
                }
                else if self.index == 2 {
                    Color.green.edgesIgnoringSafeArea(.top)
                }
                else {
                    Color.blue.edgesIgnoringSafeArea(.top)
                }
                
               
            }
            .padding(.bottom, -35)
            
            TabViews(index: self.$index)
        }
        
    }
}

#Preview {
    CustomTabView()
}


struct TabViews : View {
    @Binding var index : Int
    
    var body: some View {
        HStack {
            Button(action: {
                self.index = 0
                
            }) {
                Image(systemName: "house.fill")
            }
            .foregroundStyle(Color.black.opacity(self.index == 0 ? 1 : 0.2))
            Spacer(minLength: 0)
            
            
            Button(action: {
                self.index = 1
                
            }) {
                Image(systemName: "magnifyingglass")
            }
            .foregroundStyle(Color.black.opacity(self.index == 1 ? 1 : 0.2))
            .offset(x: 10)
            Spacer(minLength: 0)
               
            
            
            Button(action: {
                
            }) {
                Image(systemName: "plus.circle.fill")
                    .resizable()
                    .frame(width: 35, height:35)
            }
            .foregroundStyle(Color.blue)
            .offset(y: -20)
            Spacer(minLength: 0)

            
            
            Button(action: {
                self.index = 2
                
            }) {
                Image(systemName: "heart.fill")
            }
            .foregroundStyle(Color.black.opacity(self.index == 2 ? 1 : 0.2))
            .offset(x: -10)
            Spacer(minLength: 0)
               
            
            
            Button(action: {
                self.index = 3
                
            }) {
                Image(systemName: "person.fill")
            }
            .foregroundStyle(Color.black.opacity(self.index == 3 ? 1 : 0.2))
           
            
        }
        .padding(.horizontal, 35)
        .padding(.top, 35)
        .background(Color.white)
        .clipShape(CShape())
    }
}

struct CShape : Shape {
    func path(in rect: CGRect) -> Path {
        return Path{path in
            
            path.move(to: CGPoint(x: 0, y: 35))
            path.addLine(to: CGPoint(x: 0, y: rect.height))
            path.addLine(to: CGPoint(x: rect.width, y: rect.height))
            path.addLine(to: CGPoint(x: rect.width, y: 35))
            
            path.addArc(center: CGPoint(x: (rect.width / 2) + 4, y: 35), radius: 35, startAngle: .zero, endAngle: .init(degrees: 180), clockwise: true)
        }
    }
}
