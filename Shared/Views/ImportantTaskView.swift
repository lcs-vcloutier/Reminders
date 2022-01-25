//
//  ImportantTaskView.swift
//  Reminders (iOS)
//
//  Created by Vincent Cloutier on 2022-01-25.
//

import SwiftUI

struct ImportantTaskView: View {
    @ObservedObject var store: TaskStore
    var body: some View {
        List {
            ForEach(store.tasks) { task in
                if task.priority == .high {
                    TaskCell(task: task, triggerListUpdate: .constant(true))
                }
            }
            .onDelete(perform: store.deleteItems)
        }
        .navigationTitle("Important")
    }
}
