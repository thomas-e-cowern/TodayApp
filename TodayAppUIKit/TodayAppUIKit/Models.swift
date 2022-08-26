//
//  Models.swift
//  TodayAppUIKit
//
//  Created by Thomas Cowern on 8/26/22.
//

import Foundation
import RealmSwift
import UIKit

class Entry : Object {
    @Persisted var text = ""
    @Persisted var date = Date()
    let pictures = List<Picture>()
}

class Picture : Object {
    @Persisted var fullImageName = ""
    @Persisted var thumbnailName = ""
    @Persisted var entry : Entry
    
    convenience init(image: UIImage) {
        self.init()
        fullImageName = imageToUrlString(image: image)
        
    }
    
    func imageToUrlString(image: UIImage) -> String {
        if let imageData = image.pngData() {
            let fileName = UUID().uuidString + ".png"
            if var path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
                path.appendPathComponent(fileName)
                try? imageData.write(to: path)
                return fileName
            }
        }
        return ""
    }
}


