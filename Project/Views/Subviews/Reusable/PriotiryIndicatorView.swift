import SwiftUI

struct PriotiryIndicatorView: View {
    var color: Color {
        switch text {
        case "LOW": return Color.green
        case "MEDIUM": return Color.orange
        case "HIGH": return Color.red
        default: return Color.blue
        }
    }
    let text: String
    var body: some View {
        HStack{
            Image(systemName: "flag.fill")
                .font(.caption)
                .bold()
                .foregroundColor(.white)
            Text(text)
                .brightness(0.1)
                .foregroundColor(.white)
                .bold()
                .font(.caption)
        }
        .padding(.horizontal, 7)
        .padding(.vertical, 7)
        .background{
            RoundedRectangle(cornerRadius: 8)
                .fill(color)
                .opacity(0.6)
        }
        
    }
}

struct PriotiryIndicatorView_Previews: PreviewProvider {
    static var previews: some View {
        PriotiryIndicatorView(text: "Medium")
    }
}
