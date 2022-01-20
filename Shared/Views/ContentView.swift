//
//  ContentView.swift
//  Shared
//
//  Created by Vincent Cloutier on 2022-01-20.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var store: TaskStore
    var body: some View {
        List(store.tasks) { task in
            TaskCell(task: task)
        }
    }
}
