//
//  RestView.swift
//  ProBox
//
//  Created by Evan Wang on 7/2/20.
//  Copyright © 2020 Evan Wang. All rights reserved.
//

import SwiftUI

struct RestView: View {
    @Binding var start: Bool
    @Binding var rest: Bool
    @Binding var showSetting: Bool
    @Binding var to: CGFloat
    @Binding var restTime: Int
    @Binding var count: Int
    @Binding var roundCount: Int
    @Binding var roundTotal: Int
    

    var body: some View {
        ZStack {
            
            LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.5843137503, green: 0.8329633845, blue: 0.4196078479, alpha: 0.7962264151)), Color(#colorLiteral(red: 0.478228807, green: 0.8423973468, blue: 0.3462125983, alpha: 1))]), startPoint: .topLeading, endPoint: .bottomTrailing)
            .edgesIgnoringSafeArea(.all)
                .padding(-40)
            
            
                .edgesIgnoringSafeArea(.all)
                    .padding(-40)
                
            VStack {
                
                 HeaderView(showSetting: $showSetting, start: $start)
                     
                 Spacer()
                 
                 TimerView(to: $to, boxTime: $restTime, count: $count, roundCount: $roundCount, roundTotal: $roundTotal)

                 Spacer()
                 
                ButtonView(start: $start, rest: $rest, to: $to, count: $count, roundCount: $roundCount, boxTime: $restTime)
                
                }
            }
        .onTapGesture {
            self.start = false
            self.showSetting = false
        }
        .blur(radius: showSetting ? 4 : 0)
//        .animation(Animation.default.delay(0.1))
    }
}

struct RestView_Previews: PreviewProvider {
    static var previews: some View {
        RestView(start: .constant(false), rest: .constant(true), showSetting: .constant(false), to: .constant(0), restTime: .constant(3), count: .constant(0), roundCount: .constant(1), roundTotal: .constant(3))
    }
}
