//
//  ExerciseView.swift
//  Fitness
//
//  Created by Peter Bachmaier on 01.01.23.
//

import SwiftUI

struct ExerciseView: View {
    @Environment(\.managedObjectContext) var moc
    
    var exercise: Exercise
    
    @State var isAdding = false;
    @State var newReps = "";
    @State var newWeight = "";
    
    var validNewSet: Bool {
        if Int16(newReps) != nil && Int16(newWeight) != nil {
            return true
        } else {
            return false
        }
    }
    
    var body: some View {
        Form {
            imageFromData(data: exercise.image)
                .scaledToFit()
                .clipShape(Circle())
                .padding()
                .navigationTitle(exercise.name ?? "")
            
            Section("Sets") {
                ForEach(Array(((exercise.sets?.array ?? []) as! [ExerciseSet]).enumerated()), id: \.element){ i, s in
                    Group {
                        Text("\(i + 1). Set")
                        HStack {
                            Text("Repititions")
                            Spacer()
                            Text("\(s.reps)" )
                        }
                        HStack {
                            Text("Weight")
                            Spacer()
                            Text("\(s.weight) kg" )
                        }
                        Button("Delete") {
                            exercise.removeFromSets(s)
                            try? moc.save()
                            // TODO: view not updated
                        }
                    }
                }
                Button("New") {
                    isAdding = true;
                }.alert("Add set", isPresented: $isAdding) {
                    TextField("Repititions", text: $newReps)
                    TextField("Weight", text: $newWeight)
                    Button("OK") {
                        let s = ExerciseSet(context: moc)
                        s.id = UUID()
                        s.exercise = exercise
                        s.reps = Int16(newReps) ?? 0
                        s.weight = Int16(newWeight) ?? 0
                        exercise.addToSets(s)
                        try? moc.save()
                    }
                    Button("Cancel", role: .cancel) { }
                }
            }
        }
    }
}
