//
//  AddExerciseView.swift
//  Fitness
//
//  Created by Peter Bachmaier on 30.12.22.
//

import SwiftUI
import PhotosUI

struct AddExerciseView: View {
    @State var name: String = "";
    @State private var selectedItem: PhotosPickerItem? = nil
    @State private var selectedImageData: Data? = nil
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        Form {
            TextField("Name", text: $name)
            // 
            PhotosPicker(selection: $selectedItem,
                         matching: .images,
                         photoLibrary: .shared()) {
                Text("Select a photo")
                if let selectedImageData,
                   let uiImage = UIImage(data: selectedImageData) {
                    Image(uiImage: uiImage)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 250, height: 250)
                }

            }.onChange(of: selectedItem) { newItem in
                Task {
                    // Retrieve selected asset in the form of Data
                    if let data = try? await newItem?.loadTransferable(type: Data.self) {
                        selectedImageData = data
                    }
                }
            }
            
        }
        .padding()
        .navigationTitle("Add Exercise")
        .toolbar {
            ToolbarItemGroup(placement: .navigationBarTrailing) {
                Button("Submit") {
                    dismiss()
                }
            }
            
        }
        
    }
}

struct AddExerciseView_Previews: PreviewProvider {
    static var previews: some View {
        AddExerciseView()
    }
}
