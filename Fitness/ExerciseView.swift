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
        imageFromData(data: exercise.image)
            .scaledToFit()
            .clipShape(Circle())
            .padding()
            .navigationTitle(exercise.name ?? "")
    }
}
