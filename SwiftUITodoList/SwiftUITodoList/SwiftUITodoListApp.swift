//
//  SwiftUITodoListApp.swift
//  SwiftUITodoList
//
//  Created by sungyeon kim on 2022/12/28.
//

import SwiftUI

/*
    MVVM Architecture
 
    Model - data point
    View - UI
    ViewModel - manages Models for View
 
 */

@main
struct SwiftUITodoListApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ListView()
            }
            
        }
    }
}
