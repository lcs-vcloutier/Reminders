//
//  RemindersApp.swift
//  Shared
//
//  Created by Vincent Cloutier on 2022-01-20.
//

import SwiftUI

@main
struct RemindersApp: App {
    @Environment(\.scenePhase) var scenePhase
    
    @StateObject private var store = TaskStore(tasks: testData)
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView(store: store)
            }
        }
        .onChange(of: scenePhase) { newPhase in
            if newPhase == .inactive {
                print("Inactive")
            } else if newPhase == .active {
                print("Active")
            } else if newPhase == .background {
                print("Backgrounded")
                store.persistTasks()
            }
        }
    }
}
