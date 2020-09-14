//
//  ContentView.swift
//  ProBox test commit
//
//  Created by Evan Wang on 6/13/20.
//  Copyright © 2020 Evan Wang. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var time = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State var start = false
    @State var rest = false
    @State var showSetting = false
    @State var to : CGFloat = 0
    @State var count = 0
    @State var boxTime = 15
    @State var restTime = 15
    @State var roundCount = 1
    @State var roundTotal = 3
    @State var bellTime = 15
    
    
    var body: some View {
        
        ZStack{
            
            ZStack {
                if rest == false {
                    BoxView(start: $start, showSetting: $showSetting, rest: $rest, to: $to
                        , boxTime: $boxTime, count: $count, roundCount: $roundCount, roundTotal: $roundTotal)
                }
                
                if rest {
                    RestView(start: $start, rest: $rest, showSetting: $showSetting, to: $to, restTime: $restTime, count: $count, roundCount: $roundCount, roundTotal: $roundTotal)
                }
            }
            .animation(Animation.default.delay(0.05))
            .onReceive(self.time) { (_) in
                    
                    if self.start {

                        if self.rest == false {
                
                            self.count += 1
                            withAnimation(.default) {
                                    self.to = CGFloat(self.count) / CGFloat(self.boxTime)
                                }
                            
                            if self.count != self.boxTime {
                                if (self.count % self.bellTime == 0) {
                                    playSound(sound: "bell", type: "mp3")
                                }
                            }
                   
                            if self.count == (self.boxTime + 1) {
                                print("test")
                                playSound(sound: "bell", type: "mp3")
                                self.count = -1
                                self.rest.toggle()

                            }
                            
                        }
                        
                        if self.rest == true {
                                
                            self.count += 1
                            withAnimation(.default) {
                                    self.to = CGFloat(self.count) / CGFloat(self.restTime)
                                }
                            
                            if self.count != self.restTime {
                                if (self.count % self.restTime == 0) {
                                    playSound(sound: "bell", type: "mp3")
                                }
                            }
                            
                            if self.count == (self.restTime + 1) {
                                playSound(sound: "bell", type: "mp3")
                                self.count = 0
                                self.rest.toggle()
                                
                                
                                withAnimation(.default) {
                                    self.to = CGFloat(self.count) / CGFloat(self.boxTime)
                                }
                                
                                self.roundCount += 1
                                
                                if self.roundCount == (self.roundTotal + 1) {
                                    self.roundCount = self.roundTotal
                                        self.start.toggle()
                            }
                        }
                    }
                }
            }

            
            SettingView(roundTotal: $roundTotal, boxTime: $boxTime, restTime: $restTime, bellTime: $bellTime, showSetting: $showSetting)
                .offset(y: showSetting ? 0 : UIScreen.main.bounds.height)
                
        }
    }
}


func secondsToMinutesSeconds (seconds : Int) -> (String) {
    let minutes = "\((seconds % 3600) / 60)"
    let seconds = "\((seconds % 3600) % 60)"
    let secondStamp = seconds.count > 1 ? seconds : "0" + seconds
    return "\(minutes):\(secondStamp)"
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

