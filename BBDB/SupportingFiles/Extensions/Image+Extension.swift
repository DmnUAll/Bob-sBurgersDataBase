//
//  Image+Extension.swift
//  BBDB
//
//  Created by Илья Валито on 11.02.2025.
//

import SwiftUI

extension Image {
    static func convertToIcon(named name: String, withSize size: CGFloat) -> Image {
        
        guard let uiImage = UIImage(named: name) else {
            return Image(systemName: "photo.badge.exclamationmark")
        }
        
        let renderer = UIGraphicsImageRenderer(size: CGSize(width: size, height: size))
        let resizedImage = renderer.image { context in
            uiImage.draw(in: CGRect(origin: .zero, size: CGSize(width: size, height: size)))
        }
        
        return Image(uiImage: resizedImage)
    }
}
