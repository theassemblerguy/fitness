//
//  util.swift
//  Fitness
//
//  Created by Peter Bachmaier on 02.01.23.
//

import Foundation
import SwiftUI

func imageFromData(data: Data?) -> Image {
    if let imageData = data,
       let uiImage = UIImage(data: imageData) {
        return Image(uiImage: uiImage)
            .resizable()
    } else {
        return Image(systemName: "questionmark")
            .resizable()
    }
}

func osToExArray(os: NSOrderedSet?) -> [Exercise] {
    return Array((os?.array ?? []) as! [Exercise])
}
