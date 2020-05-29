//
//  MainView.swift
//  SwiftUIProject
//
//  Created by bailun on 2020/5/29.
//  Copyright © 2020 hend. All rights reserved.
//

import SwiftUI

struct MainView: View {
    let motto1 = Text("测试1").foregroundColor(.secondary)
    let motto2 = Text("测试2").foregroundColor(.pink)
    
    /// 当创建一个VStack中包含两个视图的时候，SwiftUI内部会默认创建一个TupleView来包含这两个视图，TupleView只能跟踪10种视图内容，所以这就是为什么SwiftUI在父视图内部不允许超过10视图的原因
    var body: some View {
        VStack {
            motto1
            motto2
            
            TestView(text: "哈哈")
            TestView(text: "😝")
    
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
//                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .frame(width: 200, height: 200)
                .background(Color.red)
                .blur(radius: 10)
            /// padding() 填充更多的背景色
            Button("按钮") {
                /// ModifiedContent
                print(type(of: self.body))
            }
            .frame(width: 80, height: 44)
            .padding()
            .background(Color.yellow)
            .padding()
            .background(Color.red)
            .padding()
            .background(Color.green)
//            .font(.largeTitle)
        }
        .font(.title)
        
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}


struct TestView: View {
    var text: String = ""
    var body: some View  {
        Text(text)
            .font(.largeTitle)
            .padding()
            .background(Color.red)
            .clipShape(Capsule())
    }
    
}
