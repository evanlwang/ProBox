//
//  BoxView.swift
//  ProBox
//
//  Created by Evan Wang on 7/2/20.
//  Copyright © 2020 Evan Wang. All rights reserved.
//

import SwiftUI

struct BoxView: View {
    @Binding var start: Bool
    @Binding var showSetting: Bool
    @Binding var rest: Bool
    @Binding var to: CGFloat
    @Binding var boxTime: Int
    @Binding var count: Int
    @Binding var roundCount: Int
    @Binding var roundTotal: Int
    
    
    var body: some View {
        ZStack {
            
            LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 1, green: 0.2862745098, blue: 0.2745098039, alpha: 0.8018867925)), Color(#colorLiteral(red: 1, green: 0.2862745098, blue: 0.2745098039, alpha: 1))]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)
                    .padding(-50)
            
            VStack{

                HeaderView(showSetting: $showSetting, start: $start)
                    
                Spacer()
                
                TimerView(to: $to, boxTime: $boxTime, count: $count, roundCount: $roundCount, roundTotal: $roundTotal)

                Spacer()
                
                ButtonView(start: $start, rest: $rest, to: $to, count: $count, roundCount: $roundCount, boxTime: $boxTime)
                    
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

struct BoxView_Previews: PreviewProvider {
    static var previews: some View {
        BoxView(start: .constant(false), showSetting: .constant(false), rest: .constant(false), to: .constant(0), boxTime: .constant(5), count: .constant(0), roundCount: .constant(1), roundTotal: .constant(3))
    }
}








