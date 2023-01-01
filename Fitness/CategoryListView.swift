//
//  CategoryListView.swift
//  Fitness
//
//  Created by Peter Bachmaier on 30.12.22.
//

import SwiftUI

struct CategoryListView: View {
    
    @Environment(\.managedObjectContext) var moc
    
    @FetchRequest(sortDescriptors: []) var categories: FetchedResults<ExerciseCategory>;
    @State private var addingCategory = false
    @State private var newCatText = ""
    
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
                    Button("Add") {
                        addingCategory = true
                    }.alert("Add category", isPresented: $addingCategory) {
                        TextField("Category", text: $newCatText)
                        Button("OK") {
                            let cat = ExerciseCategory(context: moc)
                            cat.name = newCatText
                            
                            try? moc.save()
                            
                            newCatText = ""
                        }
                        Button("Cancel", role: .cancel) { }
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
