//
//  CustomButtonStyle.swift
//  AdvancedSwiftUI
//
//  Created by PhuongDo on 11/09/2023.
//

import SwiftUI

struct ButtonPressStyle: ButtonStyle{
    
    let scaledAmount: CGFloat
    
    init(scaledAmount: CGFloat) {
        self.scaledAmount = scaledAmount
    }
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .opacity(configuration.isPressed ? 0.9 : 1.0)
            .brightness(configuration.isPressed ? 0.2 : 0.0)
            .scaleEffect(configuration.isPressed ? scaledAmount : 1.0)
    }
}

extension View{
    func withPressedStyle(scaleAmount: CGFloat = 1.2) -> some View{
        self.buttonStyle(ButtonPressStyle(scaledAmount: scaleAmount))
    }
}

struct CustomButtonStyleBootcamp: View {
    var body: some View {
        Button {
            
        } label: {
            Text("Click me!")
                .font(Font.headline)
                .foregroundColor(Color.white)
                .frame(height: 55)
                .frame(maxWidth:.infinity)
                .background(Color.blue)
                .cornerRadius(10)
                .shadow(color: Color.blue.opacity(0.3), radius: 10, x: 0.0, y: 10.0)
        }
        .padding(40)
        .withPressedStyle(scaleAmount: 1.2)
    }
}

struct CustomButtonStyleBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        CustomButtonStyleBootcamp()
    }
}
