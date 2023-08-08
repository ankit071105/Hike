//
//  CustomCircleView.swift
//  Hike
//
//  Created by ANKIT KUMAR on 31/07/23.
//

import SwiftUI

struct CustomCircleView: View {
    
    @State private var isAnimateGradient: Bool = false
    
    var body: some View {
        ZStack {
            Circle()
    
            .fill(LinearGradient(colors: [ .pink , .customIndigoMedium ], startPoint: isAnimateGradient ? .topLeading : .bottomLeading, endPoint: isAnimateGradient ? .bottomTrailing : .topTrailing))
            .onAppear {
                withAnimation(.linear(duration: 3.0).repeatForever(autoreverses : true)) {
                    isAnimateGradient.toggle()
                }
            }
          MotionAnimationView()
       
        }
        .frame(width: 300, height: 300)
    }
}
struct CustomCircleView_Previews: PreviewProvider {
    static var previews: some View {
        CustomCircleView()
    }
}
