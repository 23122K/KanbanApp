//
//  TaskDetailedView.swift
//  Scratchpad
//
//  Created by Patryk Maciąg on 27/04/2023.
//

import SwiftUI

struct TaskDetailedView: View {
    let task: Task
    var body: some View {
        VStack(alignment: .leading){
            TaskOverviewView(task: task)
            Spacer()
            TaskCommentsView(task: task)
        }
    }
}
