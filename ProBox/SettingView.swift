//
//  SettingView.swift
//  ProBox
//
//  Created by Evan Wang on 7/6/20.
//  Copyright © 2020 Evan Wang. All rights reserved.
//

import SwiftUI

struct SettingView: View {
    @Binding var roundTotal: Int
    @Binding var boxTime: Int
    @Binding var restTime: Int
    @Binding var bellTime: Int
    @Binding var showSetting: Bool
    
    
    var body: some View {
        
        ZStack {
            
            Rectangle()
                .fill(Color.white)
                .frame(width: UIScreen.main.bounds.width - 40, height: 325)
                .cornerRadius(18)
                .shadow(color: Color.black.opacity(0.2), radius: 20, x: 0, y: 20)
                
            
            VStack(spacing: 30.0) {
                Text("Settings")
                    .font(.system(size: 40, weight: .bold))
                        
                VStack(spacing: 15.0) {
                    
                    Stepper(value: $boxTime, in: 5...300, step: 15) {
                        HStack {
                            Text("Round Length:")
                            Text("\(secondsToMinutesSeconds(seconds: boxTime))")
                                .kerning(1)
                        }
                        .font(.system(size: 19, weight: .light))
                    }
                    .padding(.horizontal, 28)
                    
                    
                    Stepper(value: $bellTime, in: 5...boxTime, step: 15) {
                        HStack {
                            Text("Bell Interval:")
                            Text("\(secondsToMinutesSeconds(seconds: bellTime))")
                                .kerning(1)
                        }
                        .font(.system(size: 19, weight: .light))
                    }
                    .padding(.horizontal, 28)
                    
                    
                    Stepper(value: $restTime, in: 5...300, step: 15) {
                        HStack {
                            Text("Rest Length:")
                            Text("\(secondsToMinutesSeconds(seconds: restTime))")
                                .kerning(1)
                        }
                        .font(.system(size: 19, weight: .light))
                    }
                    .padding(.horizontal, 28)
                    

                    Stepper(value: $roundTotal, in: 1...10, step: 1) {
                        Text("Rounds:  \(roundTotal)")
                            .font(.system(size: 19, weight: .light))
                    }
                    .padding(.horizontal, 28)
                    
                    
                }
                .padding(.bottom, 10)
            }
            .frame(width: UIScreen.main.bounds.width - 40, height: 325)
        }
        .offset(y: -25)
        .animation(.spring(response: 0.6, dampingFraction: 0.8, blendDuration: 0))

    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color(#colorLiteral(red: 0.9882352941, green: 0.4039215686, blue: 0.3647058824, alpha: 1))
                .edgesIgnoringSafeArea(.all)
            SettingView(roundTotal: .constant(3), boxTime: .constant(15), restTime: .constant(15), bellTime: .constant(15), showSetting: .constant(false))
        }
    }
}
