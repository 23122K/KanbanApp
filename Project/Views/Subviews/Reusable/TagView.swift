//
//  TagView.swift
//  Suzie
//
//  Created by Patryk Maciąg on 03/04/2023.
//

import SwiftUI

struct TagView: View {
    let type: String
    var color: Color {
        switch type {
        case "BUG": return Color.red
        case "STORY": return Color.green
        case "TASK": return Color.blue
        case "EPIC": return Color.purple
        default: return Color.gray
        }
    }
    var body: some View {
        ZStack{
            Text(type)
                .brightness(0.1)
                .foregroundColor(color)
                .bold()
                .font(.caption)
                .padding(.horizontal, 7)
                .padding(.vertical, 7)
                .background{
                    RoundedRectangle(cornerRadius: 8)
                        .fill(color)
                        .opacity(0.2)
                }
        }
    }
}

struct TagView_Previews: PreviewProvider {
    static var previews: some View {
        TagView(type: "BUG")
    }
}
