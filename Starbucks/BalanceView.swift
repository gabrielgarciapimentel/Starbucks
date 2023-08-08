//
//  BalanceView.swift
//  Starbucks
//
//  Created by Gabriel Garcia Pimentel Mendonca on 08/08/23.
//

import UIKit

class BalanceView: UIView {
    let pointsLabel = UILabel()
    let startView = makeSymbolImageView(systemName: "star.fill")
    let starBalanceLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        style()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension BalanceView {
    func style() {
        pointsLabel.translatesAutoresizingMaskIntoConstraints = false
        pointsLabel.font = UIFont.preferredFont(forTextStyle: .largeTitle).bold()
        pointsLabel.text = "12"
        
        startView.translatesAutoresizingMaskIntoConstraints = false
        startView.tintColor = .starYellow
        startView.contentMode = .scaleAspectFit
        
        starBalanceLabel.translatesAutoresizingMaskIntoConstraints = false
        starBalanceLabel.font = UIFont.preferredFont(forTextStyle: .footnote)
        starBalanceLabel.textColor = .label
        starBalanceLabel.text = "Star balance"
    }
    
    func layout() {
        addSubview(pointsLabel)
        addSubview(startView)
        addSubview(starBalanceLabel)
        
        NSLayoutConstraint.activate([
            pointsLabel.topAnchor.constraint(equalTo: topAnchor),
            pointsLabel.leadingAnchor.constraint(equalTo: leadingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            startView.leadingAnchor.constraint(equalToSystemSpacingAfter: pointsLabel.trailingAnchor, multiplier: -2),
            startView.centerYAnchor.constraint(equalTo: pointsLabel.centerYAnchor, constant: 4),
            startView.heightAnchor.constraint(equalToConstant: 15)
        ])
        
        NSLayoutConstraint.activate([
            starBalanceLabel.leadingAnchor.constraint(equalTo: pointsLabel.leadingAnchor),
            starBalanceLabel.topAnchor.constraint(equalToSystemSpacingBelow: pointsLabel.bottomAnchor, multiplier: 0),
            starBalanceLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
            starBalanceLabel.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
}
