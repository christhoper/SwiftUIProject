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
    /// 订单金额
    @State private var checkoutAmount: String = ""
    @State private var numberOfPeople: Int = 2
    /// 小费
    @State private var tipPercentage: Int = 2
    let tipPercentages: [Int] = [10, 15, 20, 25, 0]
    /// 一个订单下来，平均每人需要付的钱
    var totalPerPerson: Double {
        let peopleCount = Double(numberOfPeople + 2)
        let tipSelected = Double(tipPercentages[tipPercentage])
        let orderAmout = Double(checkoutAmount) ?? 0
        
        let tipValue = orderAmout / 100 * tipSelected
        let grandTotal = orderAmout + tipValue
        let amoutPerPerson = grandTotal / peopleCount
        
        return amoutPerPerson
    }
    
    
    var body: some View {
//        VStack {
//            Picker("选择学生", selection: $selectedIndex) {
//                ForEach(0..<self.students.count) {
//                    Text(self.students[$0])
//                }
//            }
//            Text("您的选择是：\(students[selectedIndex])")
//        }
        NavigationView {
            Form {
                Section {
                    TextField("请输入现金",text: $checkoutAmount)
                        .keyboardType(.decimalPad)
                    
                    Picker("人数", selection: $numberOfPeople) {
                        ForEach(2..<100) {
                            Text("\($0) People")
                        }
                    }
                }
                
                Section {
                    Text("现金：\(totalPerPerson)")
                }
                
                Section(header: Text("小费所占百分比")) {
                    Picker("小费", selection: $tipPercentage) {
                        ForEach(0..<tipPercentages.count) {
                            Text("\(self.tipPercentages[$0])%")
                        }
                    }
                .pickerStyle(SegmentedPickerStyle())
                }
            }
            .navigationBarTitle(Text("Swift"))
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
