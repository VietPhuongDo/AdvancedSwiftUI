//
//  MatchedGeometryEffectBootcamp.swift
//  AdvancedSwiftUI
//
//  Created by PhuongDo on 13/09/2023.
//

import SwiftUI


struct MatchedGeometryEffectBootcamp: View {
    
    @State private var isClicked: Bool = false
    @Namespace private var namespace
    var body: some View {
        VStack{
            if !isClicked{
                RoundedRectangle(cornerRadius: 25)
                    .matchedGeometryEffect(id: "rectangle", in: namespace)
                    .frame(width: 100, height: 100)
                    
            }
        
            Spacer()
            
            if isClicked{
                RoundedRectangle(cornerRadius: 25)
                    .matchedGeometryEffect(id: "rectangle", in: namespace)
                    .frame(width: 200, height: 200 )
            }
   
        }
        .frame(maxWidth: .infinity,maxHeight: .infinity)
        .background(Color.red)
        .onTapGesture {
            withAnimation(.easeInOut) {
                isClicked.toggle()
            }
        }
    }
}




struct MatchedGeometryEffectBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        MatchedGeomestryEffect2()
    }
}

struct MatchedGeomestryEffect2: View{
    let categories: [String] = ["Home","Popular","Saved"]
    @State private var selected2: String = ""
    @Namespace private var namespace2
    var body: some View{
        HStack {
            ForEach(categories, id: \.self) { category in
                ZStack{
                    if selected2 == category{
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.red.opacity(0.5))
                            .matchedGeometryEffect(id: "category_background", in: namespace2)
                    }
                    
                    Text(category)
                }
                .frame(maxWidth: .infinity)
                .frame(height: 50)
                .onTapGesture {
                    withAnimation(.spring()) {
                        selected2 = category
                    }

            }
        }
        }
        .padding()
    }
}
