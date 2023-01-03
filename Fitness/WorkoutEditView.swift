//
//  WorkoutView.swift
//  Fitness
//
//  Created by Peter Bachmaier on 02.01.23.
//

import SwiftUI

struct WorkoutEditView: View {
    @Environment(\.managedObjectContext) var moc
    @Environment(\.dismiss) var dismiss
    @State var isAdding = false;
    
    @FetchRequest(sortDescriptors: []) var exercises: FetchedResults<Exercise>;
    
    let workout: Workout
    
    var body: some View {
        Form {
            Section("General") {
                Text(workout.name ?? "")
            }
            Section("Exercises") {
                ForEach((workout.exercises?.array ?? []) as! [Exercise], id: \.self){ ex in
                    HStack {
                        Text("\(ex.name ?? "")" )
                        Button("Delete") {
                            workout.removeFromExercises(ex)
                            try? moc.save()
                        }
                    }
                }
                Button("Add") {
                    isAdding = true;
                }.alert("Add exercise to workout", isPresented: $isAdding) {
                    List(exercises) { ex in
                        Button(ex.name ?? "<missing name>") {
                            workout.addToExercises(ex)
                            try? moc.save()
                        }
                    }
                    Button("Cancel", role: .cancel) { }
                }
            }
        }
    }
}
