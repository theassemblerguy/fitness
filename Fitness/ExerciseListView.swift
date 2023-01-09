//
//  ExerciseListView.swift
//  Fitness
//
//  Created by Peter Bachmaier on 30.12.22.
//

import SwiftUI

struct ExerciseListView: View {
    private let thumbSize: CGFloat = 40
    
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: []) var exercises: FetchedResults<Exercise>;
    
    @State private var deleteDialog = false
    @State private var itemToDelete: Exercise? = nil
    
    var body: some View {
        NavigationView {
            VStack {
                if exercises.isEmpty {
                    Text("noex")
                } else {
                    List(exercises) { exercise in
                        HStack {
                            imageFromData(data: exercise.image)
                                .scaledToFit()
                                .clipShape(Circle())
                                .frame(width: thumbSize, height: thumbSize)
                                .onLongPressGesture(perform: {
                                    itemToDelete = exercise
                                    deleteDialog = true
                                })
                            NavigationLink(exercise.name ?? "<missing name>") {
                                ExerciseView(exercise: exercise)
                            }
                            .isDetailLink(true)
                            .onLongPressGesture(perform: {
                                itemToDelete = exercise
                                deleteDialog = true
                            })
                        }.onLongPressGesture(perform: {
                            itemToDelete = exercise
                            deleteDialog = true
                        })
                    }
                }
                
            }.alert("Delete exercise?", isPresented: $deleteDialog) {
                Button("Yes") {
                    deleteItem(item: itemToDelete!)
                }
                Button("No", role: .cancel) {}
            } message: {
                let exerciseName = itemToDelete?.name ?? ""
                Text("confirm del \(exerciseName)")
                
            }
            .navigationTitle("Exercises")
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    NavigationLink(destination: AddExerciseView()) {
                        Image(systemName: "plus").font(.title)
                    }.accessibilityLabel("Add")
                }
                
            }
        }
    }
    
    func deleteItem(item: Exercise) {
        moc.delete(item)
        try? moc.save()
    }
}
