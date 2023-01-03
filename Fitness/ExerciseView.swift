//
//  ExerciseView.swift
//  Fitness
//
//  Created by Peter Bachmaier on 01.01.23.
//

import SwiftUI

struct ExerciseView: View {
    @Environment(\.managedObjectContext) var moc
    
    @FetchRequest(sortDescriptors: []) var categories: FetchedResults<ExerciseCategory>;
    
    var exercise: Exercise
    @State var category: UUID? = nil
    @State var updateViewTrigger: UInt32 = 0
    
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
            
            Picker("Category", selection: $category) {
                Text("None").tag(nil as UUID?)
                ForEach(categories) { cat in
                    
                    Text(cat.name ?? "<missing name>").tag(cat.id)
                }
            }.onAppear {
                category = exercise.category?.id
            }
            
            Section("Statistics") {
                HStack {
                    Text("nr sets")
                    Spacer()
                    Text("\(exercise.sets?.count ?? 0)")
                }
                HStack {
                    Text("nr wo")
                    Spacer()
                    Text("\(exercise.workouts?.count ?? 0)")
                }
            }
            
            Section("Sets") {
                ForEach(Array(((exercise.sets?.array ?? []) as! [ExerciseSet]).enumerated()), id: \.element){ i, s in
                    Group {
                        if updateViewTrigger == 0 {
                            // dummy to trigger view update
                        }
                        
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
                            removeSet(s: s)
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
    
    func removeSet(s: ExerciseSet) {
        exercise.removeFromSets(s)
        moc.delete(s)
        try? moc.save()
        updateViewTrigger += 1
    }
}
