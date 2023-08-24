//
//  TaskFormView.swift
//  KanbanToDoApp_project
//
//  Created by Patryk Maciąg on 31/05/2023.
//

import SwiftUI

struct TaskFormView: View {
    @StateObject private var vm = TaskFormViewModel()
    @Environment (\.dismiss) var dismiss
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack{
                Spacer()
                Image(systemName: "xmark")
                    .foregroundColor(.blue.opacity(0.7))
                    .font(.system(size: 30))
                    .onTapGesture { dismiss() }
            }
            CustomSection(title: "Title", content: {
                HStack{
                    HStack{
                        TextField("Title", text: $vm.TaskTitle)
                    }
                    Spacer(minLength: 1)
                }
            })
            
            CustomSection(title: "Description", content: {
                HStack{
                    HStack{
                        TextField("Description", text: $vm.TaskDetails)
                    }
                    Spacer(minLength: 1)
                }
            })
        
            CustomSection(title: "Details", content: {
                TextField("Type", text: $vm.TaskType)
                Divider()
                TextField("Priority", text: $vm.TaskPriority)
            })
            
            SecondaryButton(content: "Save", state: vm.isValid)
                .padding(.top)
                .onTapGesture {
                    if vm.isValid {
                        vm.createTask()
                        dismiss()
                    }
                }
            
            Spacer()
        }.padding()
    }
}

struct TaskFormView_Previews: PreviewProvider {
    static var previews: some View {
        TaskFormView()
    }
}
