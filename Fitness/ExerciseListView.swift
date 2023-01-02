//
//  ExerciseListView.swift
//  Fitness
//
//  Created by Peter Bachmaier on 30.12.22.
//

import SwiftUI

struct ExerciseListView: View {
    let thumbSize: CGFloat = 40
    
    @FetchRequest(sortDescriptors: []) var exercises: FetchedResults<Exercise>;
    
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
                            NavigationLink(exercise.name ?? "<missing name>") {
                                ExerciseView(exercise: exercise)
                            }.isDetailLink(true)
                        }
                    }
                }
                
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
}
