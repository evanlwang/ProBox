//
//  HeaderView.swift
//  ProBox
//
//  Created by Evan Wang on 7/8/20.
//  Copyright © 2020 Evan Wang. All rights reserved.
//

import SwiftUI

struct HeaderView: View {
    @Binding var showSetting: Bool
    @Binding var start: Bool
    
    var body: some View {
        HStack(alignment: .top) {
            
            VStack(alignment: .leading) {
                Text("ProBox")
                    .font(.system(size: 50, weight: .light))
                    .kerning(1)
//
//                Text(" By Evan Wang")
//                    .font(.system(size: 18, weight: .light))
            }
            .foregroundColor(Color.white)
            .shadow(radius: 3)
            
            Spacer()
            
            Image(systemName: "gear")
                .resizable()
                .frame(width: 38, height: 38)
                .foregroundColor(Color.white)
                .shadow(radius: 6)
                .offset(y: 12)
                
                .onTapGesture {
                    self.showSetting.toggle()
                    self.start = false
            }
            
        }
        .padding(.horizontal, 25)
        .padding(.top, 5)
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color(#colorLiteral(red: 0.9882352941, green: 0.4039215686, blue: 0.3647058824, alpha: 1))
                .edgesIgnoringSafeArea(.all)
            VStack {
                HeaderView(showSetting: .constant(false), start: .constant(false))
                Spacer()
            }
        }
    }
}
