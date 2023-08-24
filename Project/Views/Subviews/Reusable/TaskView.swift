import SwiftUI

struct TaskView: View {
    @EnvironmentObject var vm: ViewModel
    let task: Task
    var body: some View {
        HStack(alignment: .top) {
            VStack(alignment: .leading) {
                Text(task.title)
                    .bold()
                    .padding(.bottom, 1)
                HStack(alignment: .bottom) {
                    TagView(type: task.type)
                    PriotiryIndicatorView(text: task.priority)
                    Spacer()
                    AssignedPersonView(initials: task.user?.initials ?? "?", size: 30)
                        .padding(.trailing, 4)
                        .padding(.bottom, 4)
                }
                .padding(.horizontal, 1)
            }
        }
        .padding(7)
        .padding(.horizontal, 10)
        .background{
            RoundedRectangle(cornerRadius: 15)
            .fill(.white)
            .padding(.horizontal, 10)
            .shadow(color: Color.gray,
                    radius: 3,
                    x: 0.1, // Horizontal offset
                    y: 3) // Vertical offset
        }
    }
}
