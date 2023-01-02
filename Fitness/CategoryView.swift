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
    
    @FetchRequest private var unassignedExercises: FetchedResults<Exercise>
    
    @State var category: ExerciseCategory
    @State private var name: String = ""
    @State private var changingName = false
    @State private var isAddingExercise = false
    
    init(category: ExerciseCategory) {
        _unassignedExercises = FetchRequest(
            entity: Exercise.entity(),
            sortDescriptors: [NSSortDescriptor(keyPath: \Exercise.name, ascending: true)],
            predicate: NSPredicate(format: "category = nil")
        )
        
        self._category = State(initialValue: category)
    }
    
    var body: some View {
        
        Form {
            Button("Change name") {
                name = category.name ?? ""
                changingName = true
            }.alert("Category name", isPresented: $changingName) {
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
                }
                Button("Add") {
                    isAddingExercise = true
                }.alert("Add exercise", isPresented: $isAddingExercise) {
                    List(unassignedExercises) { ex in
                        Button(ex.name ?? "<missing name>") {
                            category.addToExercises(ex)
                            try? moc.save()
                        }
                    }
                    Button("Cancel", role: .cancel) { }
                }
            }.navigationTitle(category.name ?? "<missing name>")
        }
    }
}
