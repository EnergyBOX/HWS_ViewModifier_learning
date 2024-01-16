//
//  ContentView.swift
//  VDViewModifierTest
//
//  Created by Server Admin on 16.01.2024.
//

import SwiftUI





struct ContentView: View {
    var body: some View {
        VStack {
            Text("View 1")
                .modifier(SomeViewModifier())
        }
        VStack {
            Text("View 2")
                .someFuncTitleStyle()
        }
        VStack {
            Color.blue
                .frame(width: 300, height: 200)
                .watermarked(with: ".watermarked(with: String)")
        }

        .padding()
    }
}
//----------------------------------------------------------------------











// Thiscode frome View 1
struct SomeViewModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundStyle(.yellow)
            .padding()
            .background(.blue)
            .clipShape(Rectangle()).cornerRadius(10)
    }
}
//----------------------------------------------------------------------





// Thiscode frome View 2
extension View {
    
    /// This modifer is created for ilustration purposes, to demonstrate how to vreate custom modifermethods.
    ///
    /// Use `someFuncTitleStyle()` to set the title `modifier(SomeViewModifier())`
    func someFuncTitleStyle() -> some View {
        modifier(SomeViewModifier())
    }
}
//----------------------------------------------------------------------




// Thiscode frome View 3
struct Watermark: ViewModifier {
    var text: String
    func body(content: Content) -> some View {
        ZStack (alignment: .bottomTrailing) {
            content
            Text(text)
                .font(.caption)
                .foregroundStyle(.green)
                .padding(5)
                .background(.black)
        }
    }
}
extension View {
    func watermarked(with text: String) -> some View {
        modifier(Watermark(text: text))
    }
}


//----------------------------------------------------------------------










struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
