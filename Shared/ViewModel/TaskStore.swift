//
//  TaskStore.swift
//  Reminders (iOS)
//
//  Created by Vincent Cloutier on 2022-01-20.
//

import Foundation
import UIKit

class TaskStore: ObservableObject {
    @Published var tasks: [Task]
    init(tasks: [Task] = []) {
        self.tasks = tasks
    }
    func saveTask(description: String, priority: TaskPriority) {
        tasks.append(Task(description: description,
                          priority: priority,
                          completed: false))
    }
}

let testStore = TaskStore(tasks: testData)
