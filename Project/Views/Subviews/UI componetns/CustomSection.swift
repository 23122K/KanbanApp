import SwiftUI

struct CustomSection<Content: View>: View {
    
    let content: Content
    let title: String
    let hasBorder: Bool
    
    init(title: String, bordered: Bool = true, @ViewBuilder content: () -> Content) {
        self.content = content()
        self.title = title
        self.hasBorder = bordered
    }
    
    var body: some View {
        Text(title)
            .bold()
            .foregroundColor(.blue.opacity(0.7))
            .padding(.bottom, 0.5)
            .padding(.leading, 5)
        VStack{
            content
        }
        .padding(hasBorder ? 10 : 0)
        .background{
            if(hasBorder) {
                RoundedRectangle(cornerRadius: 10)
                    .fill(.white)
                    .shadow(color: Color.gray.opacity(0.4),
                            radius: 3,
                            x: 0.1, // Horizontal offset
                            y: 0.4) // Vertical offset
            }
        }
    }
}

struct CustomSection_Previews<Content: View>: PreviewProvider {
    static var previews: some View {
        CustomSection(title: "Test", content: {
            Text("Hello")
        })
    }
}
