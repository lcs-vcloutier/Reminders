//
//  ImportantTaskView.swift
//  Reminders (iOS)
//
//  Created by Vincent Cloutier on 2022-01-25.
//

import SwiftUI

struct ImportantTaskView: View {
    @ObservedObject var store: TaskStore
    @State private var showingAddTask = false
    @State var showingCompletedTasks = true
    var body: some View {
        List {
            ForEach(store.tasks) { task in     
                if showingCompletedTasks {
                    if task.priority == .high {
                        TaskCell(task: task, triggerListUpdate: .constant(true))
                    }
                } else {
                    if !task.completed {
                        if task.priority == .high {
                            TaskCell(task: task, triggerListUpdate: .constant(true))
                        }
                    }
                }
            }
            .onDelete(perform: store.deleteItems)
            .onMove(perform: store.moveItems)
        }
        .navigationTitle("Important")
        .toolbar {
            ToolbarItem {
                Button {
                    showingAddTask = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            ToolbarItem(placement: .primaryAction) {
                Button {
                    showingCompletedTasks.toggle()
                } label: {
                    Image(systemName: "line.3.horizontal.circle")
                }
            }
            ToolbarItem(placement: .navigationBarLeading) {
                EditButton()
            }
        }
        .sheet(isPresented: $showingAddTask) {
            AddTask(store: store, showing: $showingAddTask)
        }
    }
}
