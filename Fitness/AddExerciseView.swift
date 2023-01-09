//
//  AddExerciseView.swift
//  Fitness
//
//  Created by Peter Bachmaier on 30.12.22.
//

import SwiftUI
import PhotosUI

struct AddExerciseView: View {
    @Environment(\.managedObjectContext) var moc
    
    @State var name: String = "";
    @State private var selectedItem: PhotosPickerItem? = nil
    @State private var selectedImageData: Data? = nil
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        Form {
            TextField("Name", text: $name)
            // 
            PhotosPicker(selection: $selectedItem,
                         matching: .images) {
                Text("Select a photo")

            }.onChange(of: selectedItem) { newItem in
                Task {
                    // Retrieve selected asset in the form of Data
                    if let data = try? await newItem?.loadTransferable(type: Data.self) {
                        selectedImageData = data
                    }
                }
            }
            
            if let selectedImageData,
               let uiImage = UIImage(data: selectedImageData) {
                Image(uiImage: uiImage)
                    .resizable()
                    .clipShape(Circle())
                    .scaledToFit()
                    .frame(width: 250, height: 250)
            }
        }
        .padding()
        .navigationTitle("Add exercise")
        .toolbar {
            ToolbarItemGroup(placement: .navigationBarTrailing) {
                if !name.isEmpty && selectedItem != nil && selectedImageData != nil {
                    Button("Submit") {
                        let exercise = Exercise(context: moc)
                        exercise.id = UUID()
                        exercise.name = name
                        exercise.image = selectedImageData
                        
                        try? moc.save()
                        
                        dismiss()
                    }
                }
            }
            
        }
        
    }
}
