//
//  ExerciseListView.swift
//  Fitness
//
//  Created by Peter Bachmaier on 30.12.22.
//

import SwiftUI

struct ExerciseListView: View {
    
    @FetchRequest(sortDescriptors: []) var exercises: FetchedResults<Exercise>;
    var body: some View {
        NavigationView {
            
            VStack {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundColor(.accentColor)
                Text("Hello, world!")
                List(exercises) { exercise in
                    Text(exercise.name ?? "<missing name>")
                }
            }
            .padding()
            .navigationTitle("Exercises")
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    NavigationLink(destination: AddExerciseView()) {
                        Image(systemName: "plus").font(.title)
                    }
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
