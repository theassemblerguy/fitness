//
//  CategoryListView.swift
//  Fitness
//
//  Created by Peter Bachmaier on 30.12.22.
//

import SwiftUI

struct CategoryListView: View {
    var body: some View {
        /*
        NavigationView {
            
        }.navigationTitle("A")
        */
        NavigationView {
            VStack {
                Image(systemName: "tray.and.arrow.up.fill")
                    .imageScale(.large)
                    .foregroundColor(.accentColor)
                Text("Hello, world!")
            }
            .padding()
            .navigationTitle("Categories")
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    NavigationLink(destination: ContentView()) {
                        Image(systemName: "plus").font(.title)
                    }
                }
            }
        }
        
    }
    
    func viewDidLoad() {
        /*
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add", style: .plain, target: self, action: #selector(addTapped))
         */
    }
    
    func addTapped() {}
}

struct CategoryListView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryListView()
    }
}
