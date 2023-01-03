//
//  SetsListingView.swift
//  Fitness
//
//  Created by Peter Bachmaier on 03.01.23.
//

import SwiftUI

struct SetsListingView: View {
    let exercise: Exercise
    
    var body: some View {
        ForEach(Array((exercise.sets?.array ?? []) as! [ExerciseSet]), id: \.self){ s in
            HStack {
                Text("\(exercise.name ?? "")")
                Spacer()
                Text("\(s.reps)x")
                Text("\(s.weight) kg")
            }
        }
        
        // if exercise has no set defined, just show the exercise name
        if (exercise.sets?.array ?? []).isEmpty {
            Text(exercise.name ?? "<missing name>")
        }
    }
}
