//
//  DataController.swift
//  Fitness
//
//  Created by Peter Bachmaier on 30.12.22.
//

import CoreData
import Foundation

class DataController: ObservableObject {
    let container = NSPersistentContainer(name: "Model")
    
    init() {
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Error loading stores: \(error.localizedDescription)")
            }
        }
    }
    
}
