//
//  TimerView.swift
//  ProBox
//
//  Created by Evan Wang on 7/8/20.
//  Copyright © 2020 Evan Wang. All rights reserved.
//

import SwiftUI

struct TimerView: View {
    @Binding var to: CGFloat
    @Binding var boxTime: Int
    @Binding var count: Int
    @Binding var roundCount: Int
    @Binding var roundTotal: Int
    
    var body: some View {

        VStack(alignment: .center) {
            
            Text("\(secondsToMinutesSeconds(seconds: self.boxTime - self.count))")
                .font(.system(size: 105))
                .kerning(7)
                .foregroundColor(.white)
                .fontWeight(.thin)
            
            Text("Round \(roundCount) of \(roundTotal)")
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

struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color(#colorLiteral(red: 0.9882352941, green: 0.4039215686, blue: 0.3647058824, alpha: 1))
                .edgesIgnoringSafeArea(.all)
            TimerView(to: .constant(0), boxTime: .constant(60), count: .constant(0), roundCount: .constant(1), roundTotal: .constant(3))
        }
    }
}
