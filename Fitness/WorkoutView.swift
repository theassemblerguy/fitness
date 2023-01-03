//
//  WorkoutView.swift
//  Fitness
//
//  Created by Peter Bachmaier on 02.01.23.
//

import SwiftUI

struct WorkoutView: View {
    @Environment(\.managedObjectContext) var moc
    @Environment(\.dismiss) var dismiss
    
    let workout: Workout
    
    var body: some View {
        Form {
            Section("General") {
                Text(workout.name ?? "")
            }
            
            Section("Statistics") {
                HStack {
                    Text("nr ex")
                    Spacer()
                    Text("\(workout.exercises?.count ?? 0)")
                }
                HStack {
                    Text("nr sets")
                    Spacer()
                    let nrSets = osToExArray(os: workout.exercises).map { ex in
                        return ex.sets?.count ?? 1
                    }.reduce(0, +);
                    Text("\(nrSets)")
                }
            }
            
            Section("Exercises") {
                ForEach(osToExArray(os: workout.exercises), id: \.self){ ex in
                    SetsListingView(exercise: ex)
                }
            }
            
            Section("Actions") {
                NavigationLink("Edit", destination: WorkoutEditView(workout: workout))
                
                Button("Delete") {
                    moc.delete(workout);
                    try? moc.save();
                    dismiss()
                }
            }
        }
    }
}
