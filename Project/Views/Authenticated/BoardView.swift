//
//  BoardView.swift
//  Suzie
//
//  Created by Patryk Maciąg on 03/04/2023.
//

import SwiftUI

struct BoardView: View {
    @EnvironmentObject var vm: ViewModel
    let tasks: Array<Task>
    let tasksCount: Int
    let boardName: String
    
    @State private var selectedTask: Task?
    @State private var isPresented: Bool = false
    
    let columns = [GridItem(.flexible())]
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack{
                Text(boardName)
                    .padding(.leading, 30)
                    .padding(.vertical, 4)
                    .bold()
                Text("\(tasksCount)")
                    .foregroundColor(.gray)
                    .padding(.horizontal,5)
                    .background{
                        RoundedRectangle(cornerRadius: 5)
                            .fill(.black)
                            .opacity(0.1)
                    }
            }
            ScrollView(showsIndicators: false) {
                LazyVGrid(columns: columns) {
                    ForEach(tasks) { task in
                        TaskView(task: task)
                            .offset(y: 8)
                            .onTapGesture {
                                self.selectedTask = task
                            }
                            .onLongPressGesture{
                                vm.removeTask(task: task)
                            }
                            .sheet(item: $selectedTask){ task in
                                TaskDetailedView(task: task)
                                    .presentationDetents([.large])
                            }
                    }
                }
            }
        }
    }
}


struct BoardView_Previews: PreviewProvider {
    static var previews: some View {
        BoardView(tasks: Array<Task>(), tasksCount: 2, boardName: "To do")
    }
}

