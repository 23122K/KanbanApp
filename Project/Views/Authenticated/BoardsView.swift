import SwiftUI

struct BoardsView: View {
    @EnvironmentObject var vm: ViewModel
    var body: some View {
        NavigationView{
            VStack(alignment: .trailing){
                TabView {
                    ForEach(vm.getBoardNames(), id: \.self) { board in
                        let filteredTasks = vm.Tasks.filter{ $0.status == board}
                        BoardView(tasks: filteredTasks, tasksCount: filteredTasks.count, boardName: board)
                            .frame(width: 380, height: 650)
                    }
                }
                .refreshable {
                    vm.fetchTasks()
                }
                .tabViewStyle(.page(indexDisplayMode: .never))
            }
        }
    }
}
