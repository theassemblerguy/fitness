//
//  ExerciseView.swift
//  Fitness
//
//  Created by Peter Bachmaier on 01.01.23.
//

import SwiftUI

struct ExerciseView: View {
    var exercise: Exercise
    
    var body: some View {
        Form {
            imageFromData(data: exercise.image)
                .scaledToFit()
                .clipShape(Circle())
                .padding()
                .navigationTitle(exercise.name ?? "")
            
            Section("Sets") {
                ForEach((exercise.sets?.array ?? []) as! [ExerciseSet], id: \.self){ s in
                    HStack {
                        //Text("\(s.name ?? "")" )
                        Button("Delete") {
                            //exercise.removeFromSets(ex)
                        }
                    }
                }
            }
        }
    }
}
