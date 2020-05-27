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
    var body: some View {
        /// 默认是center
        VStack() {
            Text("我来了")
                .background(Color.red)
            Text("你还是在下面吧")
                .background(Color.green)
//            Spacer()
            //            LinearGradient(gradient: Gradient(colors: [.blue, .gray]), startPoint: .top, endPoint: .bottom)
//            RadialGradient(gradient: Gradient(colors: [.blue, .gray]), center: .center, startRadius: 20, endRadius: 200)
//            AngularGradient(gradient: Gradient(colors: [.red, .yellow, .green, .blue, .purple, .red]), center: .center)
            
            
            Button(action: {
                print("响应事件")
                self.showingAlert = true
            }) {
                HStack(alignment: .center, spacing: 50, content: {
                    
                    Image(systemName: "pencil")
                    Text("点击我")
                })
            }
            .alert(isPresented: $showingAlert) { () -> Alert in
                Alert(title: Text("温馨提示"), message: Text("终将成为过去的"), dismissButton: .default(Text("是的")))
            }
            
        }
        .background(Color.yellow)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
