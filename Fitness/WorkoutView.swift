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
            Section("Exercises") {
                ForEach(Array((workout.exercises?.array ?? []) as! [Exercise]), id: \.self){ ex in
                    Text("\(ex.name ?? "")" )
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
