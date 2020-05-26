//
//  ContentView.swift
//  SwiftUIProject
//
//  Created by bailun on 2020/5/25.
//  Copyright © 2020 hend. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    let students: [String] = ["张三","李四","王五"]
    @State private var selectedIndex: Int = 0
    
    var body: some View {
        VStack {
            Picker("选择学生", selection: $selectedIndex) {
                ForEach(0..<self.students.count) {
                    Text(self.students[$0])
                }
            }
            Text("您的选择是：\(students[selectedIndex])")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
