//
//  ViewModifier.swift
//  AdvancedSwiftUI
//
//  Created by PhuongDo on 11/09/2023.
//

import SwiftUI

struct DefaultButtonModifier: ViewModifier{
    
    let backgroundColor: Color
    
    func body(content: Content) -> some View{
        content
            .foregroundColor(.white)
            .frame(height:55)
            .frame(maxWidth:.infinity)
            .background(backgroundColor)
            .cornerRadius(10)
            .shadow(radius: 10)

    }
}

extension View{
    func withDefaultButtonFormatting(backgroundColor: Color = .blue) -> some View{
        modifier(DefaultButtonModifier(backgroundColor: backgroundColor))
    }
}

struct ViewModifierBootcamp: View {
    var body: some View {
        VStack(spacing: 30) {
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                .font(.headline)
                .withDefaultButtonFormatting(backgroundColor: .red)
            Text("Hello, World!")
                .font(.subheadline)
                .withDefaultButtonFormatting(backgroundColor: .orange)
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                .font(.title)
                .withDefaultButtonFormatting(backgroundColor: .yellow)
        }
        .padding()
    }
}

struct ViewModifier_Previews: PreviewProvider {
    static var previews: some View {
        ViewModifierBootcamp()
    }
}
