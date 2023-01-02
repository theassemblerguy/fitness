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
                    Text("No exercises defined yet, go add one")
                } else {
                    List(exercises) { exercise in
                        HStack {
                            if let imageData = exercise.image,
                               let uiImage = UIImage(data: imageData) {
                                Image(uiImage: uiImage)
                                    .resizable()
                                    .clipShape(Circle())
                                    .scaledToFit()
                                    .frame(width: thumbSize, height: thumbSize)
                            } else {
                                Image(systemName: "questionmark")
                                    .resizable()
                                    .frame(width: thumbSize, height: thumbSize)
                            }
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

struct ExerciseListView_Previews: PreviewProvider {
    static var previews: some View {
        ExerciseListView()
    }
}
