import SwiftUI

struct CustomDivider: View {
    var body: some View {
        HStack{
            Rectangle()
                .frame(height: 1)
                .opacity(0.6)
            Text("or")
                .font(.caption)
                .opacity(0.7)
                .padding(.horizontal)
            Rectangle()
                .frame(height: 1)
                .opacity(0.6)
        }
        .padding(.horizontal, 40)
    }
}

struct CustomDivider_preview: PreviewProvider {
    static var previews: some View {
        CustomDivider()
    }
}
