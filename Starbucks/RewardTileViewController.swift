//
//  RewardTileViewController.swift
//  Starbucks
//
//  Created by Gabriel Garcia Pimentel Mendonca on 08/08/23.
//

import UIKit

class RewardTileViewController: UIViewController {
    let rewardTileView = RewardTileView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        style()
        layout()
    }
}

extension RewardTileViewController {
    func style() {
        rewardTileView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func layout() {
        view.addSubview(rewardTileView)
        
        NSLayoutConstraint.activate([
            rewardTileView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            rewardTileView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            rewardTileView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            rewardTileView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}
