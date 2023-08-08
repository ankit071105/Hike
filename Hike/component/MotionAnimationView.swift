//
//  MotionAnimationView.swift
//  Hike
//
//  Created by ANKIT KUMAR on 31/07/23.
//

import SwiftUI

struct MotionAnimationView: View {
    
    @State private var randomCircle : Int = Int.random(in: 6...12)
    @State private var  isAnimating: Bool = false
     // MArk :- Functions
    // step 1 : Random Coordinate
    func RandomCoordinate() -> CGFloat {
        return CGFloat.random(in: 0...256)
    }
    // step 2 : Random Size
    func RandomSize() -> CGFloat {
        return CGFloat.random(in: 4...80)
    }
    // step 3 : Random Scale
    func RandomScale() -> CGFloat {
        return CGFloat (Double.random(in: 0.1...2.0))
    }
    // step 4 : Random Speed
    func RandomSpeed() -> Double {
        return Double.random(in: 0.05...1.0)
    }
    // step 5 : Random Delay
    func RandomDelay() -> Double {
        return Double.random(in: 0...2)
    }
    var body: some View {
        ZStack{
            ForEach(0...randomCircle, id: \.self) { item in
                Circle()
                    .foregroundColor(.white)
                    .opacity(0.5)
                    .frame(width: RandomSize())
                    .position(x: RandomCoordinate(), y: RandomCoordinate())
                    .scaleEffect(isAnimating ? RandomScale() : 1)
                    .onAppear(perform: {
                        withAnimation(
                            .interpolatingSpring(stiffness: 0.25, damping: 0.25)
                        .repeatForever()
                        .speed(RandomSpeed())
                        .delay(RandomDelay())
                        ) {
                            isAnimating = true
                        }
                            
                            }
                    )
                  
            }
        }
        .frame(width: 256, height: 256)
        .mask(Circle())
        .drawingGroup()
    }
}

struct MotionAnimationView_Previews: PreviewProvider {
    static var previews: some View {
  MotionAnimationView()
            .background(
            Circle()
                .fill(.teal))
    }
}
