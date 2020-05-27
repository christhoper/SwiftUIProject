//
//  ContentView.swift
//  SwiftUIProject
//
//  Created by bailun on 2020/5/25.
//  Copyright © 2020 hend. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var showingAlert = false
    @State private var countries = ["中国","日本","韩国","俄罗斯"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    @State private var scoreTitle = ""
    var body: some View {
//        /// 默认是center
//        VStack() {
//            Text("我来了")
//                .background(Color.red)
//            Text("你还是在下面吧")
//                .background(Color.green)
////            Spacer()
//            //            LinearGradient(gradient: Gradient(colors: [.blue, .gray]), startPoint: .top, endPoint: .bottom)
////            RadialGradient(gradient: Gradient(colors: [.blue, .gray]), center: .center, startRadius: 20, endRadius: 200)
////            AngularGradient(gradient: Gradient(colors: [.red, .yellow, .green, .blue, .purple, .red]), center: .center)
//
//
//            Button(action: {
//                print("响应事件")
//                self.showingAlert = true
//            }) {
//                HStack(alignment: .center, spacing: 50, content: {
//
//                    Image(systemName: "pencil")
//                    Text("点击我")
//                })
//            }
//            .alert(isPresented: $showingAlert) { () -> Alert in
//                Alert(title: Text("温馨提示"), message: Text("终将成为过去的"), dismissButton: .default(Text("是的")))
//            }
//
//        }
//        .background(Color.yellow)
        
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.blue, .gray, .orange]), startPoint: .top, endPoint: .bottom)
            
            VStack(alignment: .center, spacing: 30, content: {
                VStack {
                    Text("国家")
                        .foregroundColor(Color(.white))
                    Text(countries[correctAnswer])
                        .foregroundColor(Color(.white))
                        .font(.largeTitle)
                        .fontWeight(.black)
                }
                
                ForEach(0..<4) { number in
                    Button(action: {
                        print("点击事件")
                        self.flagTapped(number)
                    }) {
                        Image(self.countries[number])
                            .renderingMode(.original)
                            .clipShape(Capsule())
                            .overlay(Capsule().stroke(Color.black, lineWidth: 1))
                            .shadow(color: .black, radius: 2, x: 0, y: 0)
                        
                    }
                }
            })
            
        }
            
        .alert(isPresented: $showingAlert) { () -> Alert in
            Alert(title: Text(scoreTitle), message: Text("你的选择答案："), dismissButton: .default(Text("继续")) {
                self.askQuestion()
            })
        }
    }
    
    func flagTapped(_ number: Int) {
        if number == correctAnswer {
            scoreTitle = "正确"
        } else {
            scoreTitle = "错误"
        }
        showingAlert = true
    }
    
    func askQuestion() {
        let _ = countries.shuffled()
        correctAnswer = Int.random(in: 0...2)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
