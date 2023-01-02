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
        Text(exercise.name ?? "<unnamed>")
    }
}
