//
//  ContentView.swift
//  Fitness
//
//  Created by Peter Bachmaier on 30.12.22.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) var moc
    var body: some View {
        TabView {
            ExerciseListView()
            .tabItem {
                Label("Exercises", systemImage: "globe")
            }
            CategoryListView()
            .tabItem {
                Label("Categories", systemImage: "tray.and.arrow.up.fill")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
