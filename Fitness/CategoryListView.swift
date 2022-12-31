//
//  CategoryListView.swift
//  Fitness
//
//  Created by Peter Bachmaier on 30.12.22.
//

import SwiftUI

struct CategoryListView: View {
    
    @FetchRequest(sortDescriptors: []) var categories: FetchedResults<ExerciseCategory>;
    
    var body: some View {
        NavigationView {
            VStack {
                List(categories) { category in
                    NavigationLink(category.name ?? "<missing name>", destination: CategoryView(category: category))
                }
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
}

struct CategoryListView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryListView()
    }
}
