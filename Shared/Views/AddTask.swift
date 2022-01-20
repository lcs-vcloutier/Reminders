//
//  AddTask.swift
//  Reminders
//
//  Created by Vincent Cloutier on 2022-01-20.
//

import SwiftUI

struct AddTask: View {
    // New Task Details
    @State private var description = ""
    @State private var priority = TaskPriority.low
    // Whether to show this view
    @Binding var showing: Bool
    var body: some View {
        // Add one because this will be used in a sheet
        NavigationView {
            VStack {
                Form {
                    TextField("Description", text: $description)
                    Picker("Priority", selection: $priority) {
                        Text(TaskPriority.low.rawValue).tag(TaskPriority.low)
                        Text(TaskPriority.medium.rawValue).tag(TaskPriority.medium)
                        Text(TaskPriority.high.rawValue).tag(TaskPriority.high)
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
            }
            .navigationTitle("New Reminder")
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    Button("Save") {
                        saveTask()
                    }
                }
            }
        }
    }
    
    func saveTask() {
        showing = false
    }
}
