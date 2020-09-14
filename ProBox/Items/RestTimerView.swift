//
//  RestTimerView.swift
//  ProBox
//
//  Created by Evan Wang on 7/8/20.
//  Copyright © 2020 Evan Wang. All rights reserved.
//

import SwiftUI

struct RestTimerView: View {
    @Binding var to: CGFloat
    @Binding var restTime: Int
    @Binding var count: Int
    @Binding var roundCount: Int
    @Binding var roundTotal: Int
    
    var body: some View {
            
        VStack(alignment: .center) {
            
            Text("\(secondsToMinutesSeconds(seconds: self.restTime - self.count))")
                .font(.system(size: 105))
                .kerning(7)
                .foregroundColor(.white)
                .fontWeight(.thin)

            Text("Rest \(roundCount) of \(roundTotal)")
                .font(.system(size: 30))
                .foregroundColor(.white)
                .fontWeight(.light)
                
        }
        .shadow(radius: 3)
        .offset(x: 2, y: 10)
        .animation(nil)
        
        .overlay(
            Circle()
                .trim(from: 0, to: 1)
                .stroke(Color.white.opacity(0.2), style: StrokeStyle(lineWidth: 12, lineCap: .round))
                .frame(width: UIScreen.main.bounds.width - 57, height: UIScreen.main.bounds.height - 57)
            )
        .overlay(
            Circle()
                .trim(from: 0, to: self.to)
                .stroke(Color.white, style: StrokeStyle(lineWidth: 12, lineCap: .round))
                .frame(width: UIScreen.main.bounds.width - 57, height: UIScreen.main.bounds.height - 57)
                .rotationEffect(.init(degrees: -90))
            )
            .offset(y: -20)
    }
}

struct RestTimerView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color(#colorLiteral(red: 0.5843137255, green: 0.8235294118, blue: 0.4196078431, alpha: 1))
                .edgesIgnoringSafeArea(.all)
            RestTimerView(to: .constant(0), restTime: .constant(30), count: .constant(0), roundCount: .constant(1), roundTotal: .constant(3))
        }
    }
}
