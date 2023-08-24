//
//  PrimaryButtonView.swift
//  Suzie
//
//  Created by Patryk Maciąg on 03/04/2023.
//

import SwiftUI

struct PrimaryButtonView: View {
    let content: String
    let foregroundColor: Color
    let backgroundColor: Color
    var body: some View {
        ZStack{
            Text(content)
                .font(.title3)
                .fontWeight(.bold)
                .foregroundColor(foregroundColor)
                .padding()
                .frame(maxWidth: .infinity)
                .background(backgroundColor.opacity(0.7))
                .cornerRadius(25)
                .shadow(color: Color.gray.opacity(0.3), radius: 16)
        }
        .padding(.horizontal, 20)
    
    }
    
    init(content: String, backgorudColor: Color = .blue, foregrounColor: Color = .white) {
        self.content = content
        self.foregroundColor = foregrounColor
        self.backgroundColor = backgorudColor
    }
}

struct PrimaryButtonView_Previews: PreviewProvider {
    static var previews: some View {
        PrimaryButtonView(content: "Get started")
    }
}
