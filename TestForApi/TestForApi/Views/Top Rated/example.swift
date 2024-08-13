//
//  example.swift
//  TestForApi
//
//  Created by Habibur Rahman on 5/8/24.
//

import SwiftUI

fileprivate enum Colors: String, CaseIterable, Identifiable {
    case red
    case blue
    case orange
    case purple
    
    var id: UUID { UUID() }
    
    var color: Color {
        switch self {
        case .red:
            Color.red
        case .blue:
            Color.blue
        case .orange:
            Color.orange
        case .purple:
            Color.purple
        }
    }
}


struct example: View {
    
    private let colors: [Colors] = Colors.allCases
       
       @State private var scrollPosition: Int?
       @State private var itemsArray: [[Colors]] = []
       @State private var autoScrollEnabled: Bool = false
       private let pageWidth: CGFloat = 250
       private let pageHeight: CGFloat = 350
       private let animationDuration: CGFloat = 0.3
       private let secondsPerSlide: CGFloat = 1.0
       private let animation: Animation = .default
    
    var body: some View {
        let itemsTemp = itemsArray.flatMap { $0.map { $0 } }
                let widthDifference = UIScreen.main.bounds.width - pageWidth
                
                VStack(spacing: 20) {
                    Button(action: {
                        let isEnabled = autoScrollEnabled
                        autoScrollEnabled.toggle()
                        // going from false to true
                        if !isEnabled {
                            guard let scrollPosition = scrollPosition else {return}
                            DispatchQueue.main.asyncAfter(deadline: .now(), execute: {
                                withAnimation(animation) {
                                    self.scrollPosition = scrollPosition + 1
                                }
                            })
                        }
                    }, label: {
                        Text(autoScrollEnabled ? "Stop" : "Start")
                            .padding()
                            .foregroundStyle(.white)
                            .background(RoundedRectangle(cornerRadius: 16).fill(.black))
                    })
                        
                    ScrollView(.horizontal) {
                        HStack(spacing: 0) {
                                ForEach(0..<itemsTemp.count, id: \.self) { index in
                                    let item = itemsTemp[index]

                                Text(item.rawValue)
                                    .foregroundStyle(.black)
                                    .font(.system(size: 24, weight: .bold))
                                    .frame(width: pageWidth, height: (index == scrollPosition) ? pageHeight * 1.2 : pageHeight)
                                    .background(
                                        RoundedRectangle(cornerRadius: 16)
                                            .fill(item.color)

                                    )
                                    .padding(.horizontal, (widthDifference)/2)
                                    .offset(x: (index == scrollPosition) ? 0 : (index < scrollPosition ?? colors.count) ? widthDifference*0.75 : -widthDifference*0.75)

                            }
                        }
                        .scrollTargetLayout()
                                   }
                                   .frame(height: pageHeight * 1.3)
                                   .scrollPosition(id: $scrollPosition, anchor: .center)
                                   .scrollIndicators(.hidden)
                                   .scrollTargetBehavior(.paging)
                                   .onAppear {
                                       self.itemsArray = [colors, colors, colors]
                                       // start at the first item of the second colors array
                                       scrollPosition = colors.count
                                   }
                                   .onChange(of: scrollPosition) {
                                       guard let scrollPosition = scrollPosition else {return}
                                       print(scrollPosition)
                                       
                                       let itemCount = colors.count
                                       // last item of the first colors Array
                                       if scrollPosition / itemCount == 0 && scrollPosition % itemCount == itemCount - 1  {
                                           print("last item of the first colors")
                                           // append colors array before the first and remove the curren last color array
                                           DispatchQueue.main.asyncAfter(deadline: .now() + animationDuration) {
                                               itemsArray.removeLast()
                                               itemsArray.insert(colors, at: 0)
                                               self.scrollPosition = scrollPosition + colors.count
                                           }
                                           return
                                       }
                                       
                                       // first item of the last colors Array
                                       if scrollPosition / itemCount == 2 && scrollPosition % itemCount == 0  {
                                           print("first item of the last colors")
                                           DispatchQueue.main.asyncAfter(deadline: .now() + animationDuration) {
                                               itemsArray.removeFirst()
                                               itemsArray.append(colors)
                                               self.scrollPosition = scrollPosition - colors.count
                                           }
                                           
                                           return
                                                         }
                                                         
                                                         DispatchQueue.main.asyncAfter(deadline: .now() + secondsPerSlide, execute: {
                                                             if autoScrollEnabled {
                                                                 withAnimation(animation) {
                                                                     self.scrollPosition = scrollPosition + 1
                                                                 }
                                                             }
                                                         })
                                                     }

                                                     HStack {
                                                         ForEach(0..<colors.count, id: \.self) { index in
                                                             Button(action: {
                                                                 withAnimation(animation) {
                                                                     scrollPosition = index + colors.count
                                                                 }
                                                             }, label: {
                                                                 Circle()
                                                                     .fill(Color.gray.opacity(
                                                                         (index == (scrollPosition ?? 0) % colors.count) ? 0.8 : 0.3
                                                                     ))
                                                                     .frame(width: 15)
                                                             })
                                                         }
                                                     }
                                                     
                                                 }
                                             }
    
}


#Preview {
    example()
}
