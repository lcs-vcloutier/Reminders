//
//  Task.swift
//  Reminders (iOS)
//
//  Created by Vincent Cloutier on 2022-01-20.
//

import Foundation

class Task: Identifiable, ObservableObject {
    var id = UUID()
    var description: String
    var priority: TaskPriority
    // Watch for changes
    @Published var completed: Bool
    // Memberwise shortcut
    internal init(id: UUID = UUID(), description: String, priority: TaskPriority, completed: Bool) {
        self.id = id
        self.description = description
        self.priority = priority
        self.completed = completed
    }
}

let testData = [
    Task(description: "Task 1", priority: .high, completed: true),
    Task(description: "Task 2", priority: .medium, completed: false),
    Task(description: "Task 3", priority: .low, completed: false),
]
