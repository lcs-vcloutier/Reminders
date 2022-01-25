//
//  TaskStore.swift
//  Reminders (iOS)
//
//  Created by Vincent Cloutier on 2022-01-20.
//

import Foundation
import UIKit

class TaskStore: ObservableObject {
    // MARK: Stored propeties
    @Published var tasks: [Task]
    // MARK: Initializers
    init(tasks: [Task] = []) {
        self.tasks = tasks
    }
    // MARK: Functions
    func deleteItems(at offsets: IndexSet) {
        tasks.remove(atOffsets: offsets)
    }
    func moveItems(from source: IndexSet, to destination: Int) {
        tasks.move(fromOffsets: source, toOffset: destination)
    }
    func saveTask(description: String, priority: TaskPriority) {
        tasks.append(Task(description: description, priority: priority, completed: false))
    }
}

let testStore = TaskStore(tasks: testData)
