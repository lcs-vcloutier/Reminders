//
//  Task.swift
//  Reminders (iOS)
//
//  Created by Vincent Cloutier on 2022-01-20.
//

import Foundation
import SwiftUI
class Task: Identifiable, ObservableObject {
    var id = UUID()
    var description: String
    var priority: TaskPriority
    var taskColor: Color {
        switch priority {
        case .high:
            return Color.red
        case .medium:
            return Color.blue
        case .low:
            return Color.primary
        }
    }
    @Published var completed: Bool
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
