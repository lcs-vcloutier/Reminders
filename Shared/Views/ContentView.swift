//
//  ContentView.swift
//  Shared
//
//  Created by Vincent Cloutier on 2022-01-20.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var store: TaskStore
    @State private var showingAddTask = false
    @State var showingCompletedTasks = true
    @State var listShouldUpdate = false
    @State private var selectedPriorityForVisibleTasks: VisibleTaskPriority = .all
    var body: some View {
        let _ = print("\(listShouldUpdate)")
        
        VStack {
            Menu {
                Button(showingCompletedTasks ? "Hide Completed Tasks" : "Show Completed Tasks") {
                    showingCompletedTasks.toggle()
                }
                Picker("Priority Filter", selection: $selectedPriorityForVisibleTasks) {
                    Text(VisibleTaskPriority.all.rawValue).tag(VisibleTaskPriority.all)
                    Text(VisibleTaskPriority.low.rawValue).tag(VisibleTaskPriority.low)
                    Text(VisibleTaskPriority.medium.rawValue).tag(VisibleTaskPriority.medium)
                    Text(VisibleTaskPriority.high.rawValue).tag(VisibleTaskPriority.high)
                }
                .pickerStyle(MenuPickerStyle())
            } label: {
                Image(systemName: "line.3.horizontal.circle")
            }
            
            List {
                ForEach(store.tasks) { task in
                    if showingCompletedTasks {
                        if selectedPriorityForVisibleTasks == .all {
                            TaskCell(task: task, triggerListUpdate: .constant(true))
                        } else {
                            if task.priority.rawValue == selectedPriorityForVisibleTasks.rawValue {
                                TaskCell(task: task, triggerListUpdate: .constant(true))
                            }
                        }
                    } else {
                        if !task.completed {
                            if selectedPriorityForVisibleTasks == .all {
                                TaskCell(task: task, triggerListUpdate: .constant(true))
                            } else {
                                if task.priority.rawValue == selectedPriorityForVisibleTasks.rawValue {
                                    TaskCell(task: task, triggerListUpdate: .constant(true))
                                }
                            }
                        }
                    }
                }
                .onDelete(perform: store.deleteItems)
                .onMove(perform: store.moveItems)
            }
            .navigationTitle("Reminders")
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    Button("Add") {
                        showingAddTask = true
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
}
