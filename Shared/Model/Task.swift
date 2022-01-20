//
//  Task.swift
//  Reminders (iOS)
//
//  Created by Vincent Cloutier on 2022-01-20.
//

import Foundation

struct Task: Identifiable {
    var id = UUID()
    var description: String
    var priority: TaskPriority
    var completed: Bool
}

let testData = [
    Task(description: "Task 1", priority: .high, completed: true),
    Task(description: "Task 2", priority: .medium, completed: false),
    Task(description: "Task 3", priority: .low, completed: false),

]
