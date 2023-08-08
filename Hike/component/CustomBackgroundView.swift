//
//  CustomBackgroundView.swift
//  Hike
//
//  Created by ANKIT KUMAR on 30/07/23.
//

import SwiftUI

struct CustomBackgroundView: View {
    var body: some View {
        ZStack {
            // Mark:- 3. Depth
            Color.customGreenDark
                .cornerRadius(40)
                .offset(y: 12)
            // Mark :- 2. Light
            Color.customGreenLight
                .cornerRadius(50)
                .offset(y: 3)
                .opacity(0.85)
            // Mark :- 1 .surface
            LinearGradient(colors: [
                .customGreenLight ,
                .customGreenMedium ],
                startPoint: .top,
                endPoint: .bottom)
            .cornerRadius(40)
       
        }
        
    }
    
}
struct CustomBackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        CustomBackgroundView()
            .padding()
    }
}
