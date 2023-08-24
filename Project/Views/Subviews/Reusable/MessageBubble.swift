import SwiftUI

struct MessageBubble: View {
    let corners: UIRectCorner
    let comment: Comment

    init(corners: UIRectCorner = [], comment: Comment, showTime: Bool = false) {
        self.corners = corners
        self.comment = comment
    }
    
    var body: some View {
        VStack(alignment: comment.isSedner ? .trailing : .leading){
            HStack{
                Text(comment.content.count > 2 ? comment.content : " \(comment.content) ")
                    .padding(10)
                    .foregroundColor(comment.isSedner ? .white : .black)
                    .background(comment.isSedner ? Color.blue.opacity(0.8) : Color.gray.opacity(0.12))
                    .cornerRadius(7)
                    .cornerRadius(20, corners: corners)
            }
            .frame(maxWidth: 300, alignment: comment.isSedner ? .trailing : .leading)

        }
        .frame(maxWidth: .infinity, alignment: comment.isSedner ? .trailing : .leading)
        .padding(.horizontal, 5)
    }
}

struct MessageBubble_Previews: PreviewProvider {
    static var previews: some View {
        MessageBubble(comment: Comment())
    }
}
