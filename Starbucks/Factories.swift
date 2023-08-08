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

extension UIColor {
    static let starYellow = UIColor(red: 204/255, green: 153/255, blue: 51/255, alpha: 1)
    static let tileBrown = UIColor(red: 235/255, green: 235/255, blue: 228/255, alpha: 1)
    static let darkGreen = UIColor(red: 0/255, green: 133/255, blue: 67/255, alpha: 1)
    static let lightGreen = UIColor(red: 0/255, green: 171/255, blue: 90/255, alpha: 1)
    static let backgroundWhite = UIColor(red: 247/255, green: 247/255, blue: 247/255, alpha: 1)
}

func makeGreenButton(withText text: String) -> UIButton {
    let button = UIButton()
    var configuration = UIButton.Configuration.plain()
    button.translatesAutoresizingMaskIntoConstraints = false
    button.setTitle(text, for: .normal)
    button.titleLabel?.adjustsFontSizeToFitWidth = true
    configuration.contentInsets = NSDirectionalEdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16)
    configuration.baseForegroundColor = .white
    button.configuration = configuration
    button.layer.cornerRadius = 40/2
    button.backgroundColor = .darkGreen
    
    return button
}

func makeClearButton(withText text: String) -> UIButton {
    let button = UIButton()
    var configuration = UIButton.Configuration.plain()
    
    button.translatesAutoresizingMaskIntoConstraints = false
    button.setTitle(text, for: .normal)
    button.setTitleColor(.black, for: .normal)
    button.titleLabel?.adjustsFontSizeToFitWidth = true
    configuration.contentInsets = NSDirectionalEdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16)
    configuration.baseForegroundColor = .black
    button.configuration = configuration
    button.layer.cornerRadius = 40/2
    button.layer.borderWidth = 0.5
    button.layer.borderColor = UIColor.label.cgColor
    button.backgroundColor = .systemBackground
    
    return button
}

func makeSymbolImageView(systemName: String, scale: UIImage.SymbolScale = .large) -> UIImageView {
    let configuration = UIImage.SymbolConfiguration(scale: scale)
    let image = UIImage(systemName: systemName, withConfiguration: configuration)
    
    return UIImageView(image: image)
}
