//
//  CategoryView.swift
//  Fitness
//
//  Created by Peter Bachmaier on 31.12.22.
//

import SwiftUI

struct CategoryView: View {
    
    @Environment(\.managedObjectContext) var moc
    @Environment(\.dismiss) var dismiss
    
    @State var category: ExerciseCategory
    @State private var name: String = ""
    @State private var changingName = false
    
    var body: some View {
        
        Form {
            Button("Change name") {
                name = category.name ?? ""
                changingName = true
            }.alert("Category Name", isPresented: $changingName) {
                TextField("Name", text: $name)
                Button("OK") {
                    category.name = name
                    
                    try? moc.save()
                }
                Button("Cancel", role: .cancel) { }
            }
            Section("Exercises") {
                List {
                    ForEach(Array(category.exercises as? Set<Exercise> ?? []), id: \.self){ ex in
                        Text("\(ex.name ?? "")" )
                    }
                    /*
                    HStack {
                        Text("Ex 1")
                        Spacer()
                        Button("Remove") {}
                    }
                     */
                    
                }
                Button("Add") {
                    
                }
            }
        }.toolbar {
            
            /*
            ToolbarItemGroup(placement: .navigationBarTrailing) {
                if category.name != name {
                    Button("Save") {
                        // todo save in db
                        category.name = name
                        
                        try? moc.save()
                        
                        //dismiss()
                    }
                }
            }
             */
        }.navigationTitle(category.name ?? "unnamed")
    }
}
