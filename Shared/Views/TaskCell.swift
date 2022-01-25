//
//  TaskCell.swift
//  Reminders
//
//  Created by Vincent Cloutier on 2022-01-20.
//

import SwiftUI

struct TaskCell: View {
    @ObservedObject var task: Task
    @Binding var triggerListUpdate: Bool
    var body: some View {
        HStack {
            Image(systemName: task.completed ? "checkmark.circle.fill" : "circle")
                .onTapGesture {
                    task.completed.toggle()
                    withAnimation {
                        triggerListUpdate.toggle()
                    }
                }
            Text(task.description)
        }
        .foregroundColor(task.taskColor)
    }
}
