//
//  ButtonView.swift
//  ProBox
//
//  Created by Evan Wang on 7/8/20.
//  Copyright © 2020 Evan Wang. All rights reserved.
//

import SwiftUI

struct ButtonView: View {
    @Binding var start: Bool
    @Binding var rest: Bool
    @Binding var to: CGFloat
    @Binding var count: Int
    @Binding var roundCount: Int
    @Binding var boxTime: Int
    
    var body: some View {
        HStack(spacing: 20) {
            
            Button(action: {
                
                if self.count == self.boxTime {
                    
                    self.count = 0
                    withAnimation(.default){
                        
                        self.to = 0
                    }
                }
                self.start.toggle()
                
            }) {
                
                HStack(spacing: 15){
                    
                    Image(systemName: self.start ? "pause.fill" : "play.fill")
                        .foregroundColor(.black)
                    
                    Text(self.start ? "Stop" : "Start")
                        .foregroundColor(.black)
                        .font(.system(size: 17, weight: .light))
                        
                }
                .padding(.vertical)
                .frame(width: (UIScreen.main.bounds.width / 2) - 55)
                .background(Color.white)
                .clipShape(Capsule())
                .shadow(radius: 6)
                .animation(nil)
            }
            
            Button(action: {
                
                self.count = 0
                self.roundCount = 1
                
                withAnimation(.default){
                    
                    self.to = 0
                }
                self.start = false
                self.rest = false
                
            }) {
                
                HStack(spacing: 15){
                    
                    Image(systemName: "arrow.clockwise")
                        .foregroundColor(.white)
                    
                    Text("Reset")
                        .foregroundColor(.white)
                        .font(.system(size: 17, weight: .light))
                    
                }
                .padding(.vertical)
                .frame(width: (UIScreen.main.bounds.width / 2) - 55)
                .background(
                    
                    Capsule()
                        .stroke(Color.white, lineWidth: 3)
                )
                    .shadow(radius: 6)
            }
        }
        .padding(.bottom, 25)
    }
}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color(#colorLiteral(red: 0.9882352941, green: 0.4039215686, blue: 0.3647058824, alpha: 1))
                .edgesIgnoringSafeArea(.all)
            VStack {
                Spacer()
                ButtonView(start: .constant(false), rest: .constant(false), to: .constant(0), count: .constant(0), roundCount: .constant(1), boxTime: .constant(30))
            }
        }
    }
}
