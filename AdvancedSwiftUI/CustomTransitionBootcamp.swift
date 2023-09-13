//
//  CustomTransitionBootcamp.swift
//  AdvancedSwiftUI
//
//  Created by PhuongDo on 12/09/2023.
//

import SwiftUI

struct RotateModifier: ViewModifier{
    
    let rotationDegree: Double
    func body(content: Content) -> some View {
        content
            .rotationEffect(Angle(degrees: rotationDegree))
            .offset(x: rotationDegree != 0  ? UIScreen.main.bounds.width : 0, y: rotationDegree != 0  ? UIScreen.main.bounds.height : 0)

    }
}

extension AnyTransition{
    
    static var rotating: AnyTransition{
        return AnyTransition.modifier(active: RotateModifier(rotationDegree: 180), identity: RotateModifier(rotationDegree: 0))
    }
    
    static func rotating(rotationDegree: Double) -> AnyTransition{
        return AnyTransition.modifier(active: RotateModifier(rotationDegree: rotationDegree), identity: RotateModifier(rotationDegree: 0))
    }
    
    static var rotateOn: AnyTransition{
        return AnyTransition.asymmetric(insertion: .rotating, removal: .move(edge: .leading))
    }
    
}


struct CustomTransitionBootcamp: View {
    
    @State private var showRoundRectangle: Bool = false
    
    var body: some View {
        VStack {
            Spacer()
            if showRoundRectangle{
                RoundedRectangle(cornerRadius: 25)
                    .frame(width: 200, height: 300, alignment: .center)
                    .frame(maxWidth: .infinity,maxHeight: .infinity)
                    .transition(.rotateOn)
            }
            Spacer()
            Text("Click me!")
                .withDefaultButtonFormatting()
                .padding(.horizontal, 40)
                .onTapGesture {
                    withAnimation(.easeInOut(duration: 0.5)) {
                        showRoundRectangle.toggle()
                    }
                }
        }
    }
}

struct CustomTransitionBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        CustomTransitionBootcamp()
    }
}
