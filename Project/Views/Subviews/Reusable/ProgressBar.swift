//
//  ProgressBar.swift
//  KanbanToDoApp_project
//
//  Created by Patryk Maciąg on 01/06/2023.
//

import SwiftUI

struct ProgressBar: View {
    @Binding var value: Float
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                Rectangle().frame(width: geometry.size.width , height: geometry.size.height)
                    .opacity(0.3)
                    .foregroundColor(Color.gray.opacity(0.4))
                
                Rectangle().frame(width: min(CGFloat(value)*geometry.size.width, geometry.size.width), height: geometry.size.height)
                    .foregroundColor(.blue.opacity(0.7))
                    .cornerRadius(15)
            }.cornerRadius(15.0)
        }
        .frame(height: 20)
    }
}

struct ProgressBar_Previews: PreviewProvider {
    static var previews: some View {
        ProgressBar(value: .constant(0.7))
    }
}
