//
//  TodoAppApp.swift
//  TodoApp
//
//  Created by Abdelrahman Shehab on 04/05/2023.
//

import SwiftUI

@main
struct TodoAppApp: App {
    @StateObject var listViewModel: ListViewModel = ListViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ListView()
            }
            .environmentObject(listViewModel)
        }
    }
}
