//
//  HomeHeaderView.swift
//  Starbucks
//
//  Created by Gabriel Garcia Pimentel Mendonca on 05/08/23.
//

import UIKit

protocol HomeHeaderViewDelegate: AnyObject {
    func didTapHistoryButton(_ sender: HomeHeaderView)
}

class HomeHeaderView: UIView {
    
    let greeting = UILabel()
    let inboxButton = UIButton()
    let historyButton = UIButton()
    
    weak var delegate: HomeHeaderViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        style()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension HomeHeaderView {
    func style() {
        backgroundColor = .white
        greeting.translatesAutoresizingMaskIntoConstraints = false
        greeting.font = UIFont.preferredFont(forTextStyle: .largeTitle)
        greeting.text = "Good afternoon, Gabriel ☀️"
        greeting.numberOfLines = 0
        greeting.lineBreakMode = .byWordWrapping
        
        makeInboxButton()
        makeHistoryButton()
        historyButton.addTarget(self, action: #selector(handleHistoryButton), for: .primaryActionTriggered)
    }
    
    func layout() {
        addSubview(greeting)
        addSubview(inboxButton)
        addSubview(historyButton)
        
        NSLayoutConstraint.activate([
            greeting.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 1),
            greeting.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 1),
            trailingAnchor.constraint(equalToSystemSpacingAfter: greeting.trailingAnchor, multiplier: 1)
        ])
        
        NSLayoutConstraint.activate([
            inboxButton.topAnchor.constraint(equalToSystemSpacingBelow: greeting.bottomAnchor, multiplier: 2),
            inboxButton.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 2),
            bottomAnchor.constraint(equalToSystemSpacingBelow: inboxButton.bottomAnchor, multiplier: 1),
            inboxButton.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.25)
        ])
        
        NSLayoutConstraint.activate([
            historyButton.topAnchor.constraint(equalToSystemSpacingBelow: greeting.bottomAnchor, multiplier: 2),
            historyButton.leadingAnchor.constraint(equalToSystemSpacingAfter: inboxButton.trailingAnchor, multiplier: 2),
            bottomAnchor.constraint(equalToSystemSpacingBelow: inboxButton.bottomAnchor, multiplier: 1),
            historyButton.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.25)
        ])
    }
}

extension HomeHeaderView {
    func makeInboxButton() {
        makeButton(button: inboxButton, systemName: "envelope", text: "Inbox")
    }
    
    func makeHistoryButton() {
        makeButton(button: historyButton, systemName: "calendar", text: "History")
    }
    
    func makeButton(button: UIButton, systemName: String, text: String) {
        button.translatesAutoresizingMaskIntoConstraints = false
        let configuration = UIImage.SymbolConfiguration(scale: .large)
        let image = UIImage(systemName: systemName, withConfiguration: configuration)
        
        button.setImage(image, for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        
        button.setTitle(text, for: .normal)
        
        var buttonConfiguration = UIButton.Configuration.plain()
        buttonConfiguration.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
        buttonConfiguration.imagePadding = 16
        buttonConfiguration.baseForegroundColor = .secondaryLabel
        button.configuration = buttonConfiguration
//        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 16)
//        button.contentEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
}


// MARK: Factories
extension HomeHeaderView {
    
    @objc func handleHistoryButton() {
        delegate?.didTapHistoryButton(self)
    }
}
