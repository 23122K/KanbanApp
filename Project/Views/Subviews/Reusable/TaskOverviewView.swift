//
//  TaskOverviewView.swift
//  Scratchpad
//
//  Created by Patryk Maciąg on 29/04/2023.
//

import SwiftUI

struct TaskOverviewView: View {
    @Environment (\.dismiss) var dismiss
    @EnvironmentObject var vm: ViewModel
    let task: Task
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(task.title)
                .font(.system(size: 30))
                .fontWeight(.semibold)
                .foregroundColor(.blue.opacity(0.7))
                .bold()
                .padding()
            
            CustomSection(title: "Description", content: {
                HStack{
                    HStack{
                        Text(task.details)
                    }
                    Spacer(minLength: 1)
                }
            })
            
            CustomSection(title: "Task status", bordered: false, content: {
                ZStack{
                    RoundedRectangle(cornerRadius: 10)
                        .fill(.green.opacity(0.7))
                        .frame(height: 50)
                    Text(task.status.capitalized)
                        .bold()
                        .foregroundColor(.white)
                }
            })
        
            CustomSection(title: "Details", content: {
                DetailedRowView(title: "Task type", content: {
                    Text(task.type)
                })
                Divider()
                DetailedRowView(title: "Priority", content: {
                    Text(task.priority)
                })
                Divider()
                DetailedRowView(title: "Asagniee", content: {
                    if task.user != nil  {
                        Text("\(task.user!.firstName) \(task.user!.lastName)")
                    } else {
                        HStack{
                            Text("Assigne me")
                            Image(systemName: "person.crop.circle.badge.plus")
                        }
                        .foregroundColor(.blue.opacity(0.7))
                        .onTapGesture {
                            vm.assignUserToTask(task: task)
                            dismiss()
                            DispatchQueue.main.asyncAfter(deadline: .now()+0.5, execute: {
                                vm.fetchTasks()
                            })
                        }
                    }
                })
            })
            
            if let asignee = task.user?.id, let user = vm.user?.id, asignee == user {
                CustomSection(title: "Task status", bordered: false, content: {
                    ZStack{
                        RoundedRectangle(cornerRadius: 10)
                            .fill(.blue.opacity(0.7))
                            .frame(height: 50)
                        HStack{
                            Text(assesWhereToMoveTask)
                                .bold()
                                .foregroundColor(.white)
                            Image(systemName: "chevron.right.circle")
                                .foregroundColor(.white)
                        }
                    }
                    .onTapGesture {
                        vm.updateTaskStatus(task: task, status: assesWhereToMoveTask)
                        dismiss()
                    }
                })
            }
            Spacer()
        }.padding()
    }
    
    var assesWhereToMoveTask: String {
        switch task.status {
        case "To do": return "In progress"
        case "In progress": return "Done"
        default: return "To do"
        }
    }
}

struct TaskOverviewView_Previews: PreviewProvider {
    static var previews: some View {
        TaskOverviewView(task: Task())
            .environmentObject(ViewModel())
    }
}
