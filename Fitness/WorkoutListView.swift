//
//  CategoryListView.swift
//  Fitness
//
//  Created by Peter Bachmaier on 30.12.22.
//

import SwiftUI

struct WorkoutListView: View {
    
    @Environment(\.managedObjectContext) var moc
    
    @FetchRequest(sortDescriptors: []) var workouts: FetchedResults<Workout>;
    @State private var addingWorkout = false
    @State private var newWorkoutName = ""
    
    var body: some View {
        NavigationView {
            VStack {
                List(workouts) { workout in
                    NavigationLink(workout.name ?? "<missing name>", destination: WorkoutView(workout: workout))
                }
            }
            .padding()
            .navigationTitle("Workouts")
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    Button("Add") {
                        addingWorkout = true
                    }.alert("Add workout", isPresented: $addingWorkout) {
                        TextField("Workout", text: $newWorkoutName)
                        Button("OK") {
                            let work = Workout(context: moc)
                            work.name = newWorkoutName
                            
                            try? moc.save()
                            
                            newWorkoutName = ""
                        }
                        Button("Cancel", role: .cancel) { }
                    }
                }
            }
        }
        
    }
}