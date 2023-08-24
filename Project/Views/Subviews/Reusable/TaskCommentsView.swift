import SwiftUI

struct TaskCommentsView: View {
    @EnvironmentObject var vm: ViewModel
    let task: Task

    @State private var comment: String = ""
    var body: some View {
        VStack{
            ScrollView(showsIndicators: false) {
                if(vm.comments.count > 0){
                    VStack(spacing: 1){
                        ForEach(Array(vm.comments.enumerated()), id: \.element) { index, comment in
                            let info = getMessageBubbleInfo(forIndex: index, messages: vm.comments)
                            MessageBubble(corners: info.coreners, comment: comment)
                                .padding(info.isEnd ? .bottom : Edge.Set.Element())
                        }
                    }
                    .padding(.top)
                }
            }
            MessageField(task: task, content: $comment)
                .onAppear{ vm.fetchComments(task: task)}
        }
    }
    
    //Determines how to round message cornes
    func getMessageBubbleInfo(forIndex i: Int, messages: [Comment]) -> (coreners: UIRectCorner, isEnd: Bool) {
        let messageCount = messages.count
        
        switch (i, messageCount) {
        case (0, _):
            if  messageCount == 1 || messages[i].isSedner != messages[i+1].isSedner {
                return ([.allCorners], true)
            } else {
                switch(messages[i].isSedner){
                case true:
                    return ([.topLeft, .topRight, .bottomLeft], false)
                case false:
                    return ([.topLeft, .topRight, .bottomRight], false)
                }
            }
        case (messageCount - 1, _):
            if messages[i].isSedner != messages[i-1].isSedner {
                return ([.allCorners], true)
            } else {
                switch(messages[i].isSedner){
                case true:
                    return ([.bottomLeft, .bottomRight, .topLeft], false)
                case false:
                    return ([.bottomLeft, .bottomRight, .topRight], false)
                }
            }
        default:
            if messages[i].isSedner != messages[i-1].isSedner && messages[i].isSedner != messages[i+1].isSedner {
                return ([.allCorners], true)
            } else if messages[i].isSedner != messages[i-1].isSedner {
                switch(messages[i].isSedner){
                case true:
                    return ([.topLeft, .bottomLeft, .topRight], false)
                case false:
                    return ([.topLeft, .bottomRight, .topRight], false)
                }
            } else if messages[i].isSedner != messages[i+1].isSedner {
                switch(messages[i].isSedner){
                case true:
                    return ([.topLeft, .bottomLeft, .bottomRight], true)
                case false:
                    return ([.topRight, .bottomLeft, .bottomRight], true)
                }
            } else {
                switch(messages[i].isSedner){
                case true:
                    return ([.topLeft, .bottomLeft], false)
                case false:
                    return ([.topRight, .bottomRight], false)
                }
            }
        }
    }
}

struct TaskCommentsView_Previews: PreviewProvider {
    static var previews: some View {
        TaskCommentsView(task: Task())
    }
}
