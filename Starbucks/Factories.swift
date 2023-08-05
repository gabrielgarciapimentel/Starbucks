//
//  Factories.swift
//  Starbucks
//
//  Created by Gabriel Garcia Pimentel Mendonca on 05/08/23.
//

import UIKit

extension UIFont {
    private func withTraits(traits: UIFontDescriptor.SymbolicTraits) -> UIFont {
        if let descriptor = fontDescriptor.withSymbolicTraits(traits) {
            return UIFont(descriptor: descriptor, size: 0)
        }
        return UIFont()
    }
    
    func bold() -> UIFont {
        return withTraits(traits: .traitBold)
    }
}
