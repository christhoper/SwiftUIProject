//
//  Day4View.swift
//  SwiftUIProject
//
//  Created by bailun on 2020/5/29.
//  Copyright © 2020 hend. All rights reserved.
//

import SwiftUI

struct Day4View: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .titleStyle()
            .watermarked(with: "hahaa")
    }
}

extension View {
    func titleStyle() -> some View {
        self.modifier(Title())
    }
    
    func watermarked(with text: String) -> some View {
        self.modifier(Watermark(text: text))
    }
}

struct Day4View_Previews: PreviewProvider {
    static var previews: some View {
        Day4View()
    }
}

struct Title: ViewModifier {
    func body(content: Content) -> some View {
        content.font(.largeTitle)
            .foregroundColor(.white)
            .padding()
            .background(Color.blue)
            .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

/// 水印
struct Watermark: ViewModifier {
    var text: String
    func body(content: Content) -> some View {
        ZStack {
            content
            Text(text)
                .font(.caption)
                .foregroundColor(.white)
                .padding(5)
                .background(Color.black)
        }
    }
}

