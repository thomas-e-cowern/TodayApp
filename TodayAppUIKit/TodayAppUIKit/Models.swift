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
    var pictures = [Picture]()
}

class Picture : Object {
    @Persisted var fullImageName = ""
    @Persisted var thumbnailName = ""
    @Persisted var entry : Entry?
    
    convenience init(image: UIImage) {
        self.init()
        fullImageName = imageToUrlString(image: image)
        let targetSize = CGSize(width: 500, height: 500)
        let scaledImageSize = image.scalePreservingAspectRatio(targetSize: targetSize)
        thumbnailName = imageToUrlString(image: scaledImageSize)
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
        print("Something is wrong")
        return ""
    }
}

extension UIImage {
    func scalePreservingAspectRatio(targetSize: CGSize) -> UIImage {
        // Determine the scale factor that preserves aspect ratio
        let widthRatio = targetSize.width / size.width
        let heightRatio = targetSize.height / size.height
        
        let scaleFactor = min(widthRatio, heightRatio)
        
        // Compute the new image size that preserves aspect ratio
        let scaledImageSize = CGSize(
            width: size.width * scaleFactor,
            height: size.height * scaleFactor
        )

        // Draw and return the resized UIImage
        let renderer = UIGraphicsImageRenderer(
            size: scaledImageSize
        )

        let scaledImage = renderer.image { _ in
            self.draw(in: CGRect(
                origin: .zero,
                size: scaledImageSize
            ))
        }
        
        return scaledImage
    }
}

