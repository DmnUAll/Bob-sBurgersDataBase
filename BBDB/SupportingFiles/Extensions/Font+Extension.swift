//
//  Font+Extension.swift
//  BBDB
//
//  Created by Илья Валито on 11.02.2025.
//

import SwiftUI

extension Font {
    enum FontType {
        case filled
        case empty
    }
    
    static func bobsBurgersEn(style: FontType, size: CGFloat) -> Font {
        switch style {
        case .filled:
                .custom("Bob'sBurgers", size: size)
        case .empty:
                .custom("Bob'sBurgers2", size: size)
        }
    }
    
    static func bobsBurgersRu(style: FontType, size: CGFloat) -> Font {
        switch style {
        case .filled:
                .custom("Banco", size: size)
        case .empty:
                .custom("CampusOtl", size: size)
        }
    }
    
    static func localizedFont(style: FontType, size: CGFloat) -> Font {
        guard let systemLanguage = Locale.current.language.languageCode?.identifier else {
            return bobsBurgersEn(style: style, size: size)
        }

        switch systemLanguage {
        case "ru":
            return bobsBurgersRu(style: style, size: size)
        default:
            return bobsBurgersEn(style: style, size: size)
        }
    }
}
