//
//  RewardTileView.swift
//  Starbucks
//
//  Created by Gabriel Garcia Pimentel Mendonca on 08/08/23.
//

import UIKit

class RewardTileView: UIView {
    
    let balanceView = BalanceView()
    var rewardsButton = UIButton()
    let rewardsGraphView = RewardGraphView()
    let starRewardsView = StarRewardsView()
    var detailsButton = makeClearButton(withText: "Details")
    
    var heightConstraint: NSLayoutConstraint?
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        layer.cornerRadius = 8
        style()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    // TODO: remove color after end component
//    override var intrinsicContentSize: CGSize {
//        return CGSize(width: 100, height: 300)
//    }
}

extension RewardTileView {
    func style() {
        balanceView.translatesAutoresizingMaskIntoConstraints = false
        rewardsGraphView.translatesAutoresizingMaskIntoConstraints = false
        starRewardsView.translatesAutoresizingMaskIntoConstraints = false
        
        makeRewardOptionButton()
    }
    
    func makeRewardOptionButton() {
        rewardsButton.translatesAutoresizingMaskIntoConstraints = false
        rewardsButton.addTarget(self, action: #selector(rewardOptionsTapped), for: .primaryActionTriggered)
        
        let imageConfiguration = UIImage.SymbolConfiguration(scale: .small)
        let image = UIImage(systemName: "chevron.down", withConfiguration: imageConfiguration)
        var configuration = UIButton.Configuration.plain()
        
        rewardsButton.setImage(image, for: .normal)
        rewardsButton.imageView?.tintColor = .label
        rewardsButton.imageView?.contentMode = .scaleAspectFit
        
        rewardsButton.setTitleColor(.label, for: .normal)
        rewardsButton.titleLabel?.font = UIFont.preferredFont(forTextStyle: .footnote)
        
        rewardsButton.semanticContentAttribute = .forceRightToLeft
        configuration.contentInsets = NSDirectionalEdgeInsets(top: 8, leading: 0, bottom: 8, trailing: 20)
        configuration.imagePadding = 20
        configuration.title = "Rewards options"
        configuration.titleTextAttributesTransformer = UIConfigurationTextAttributesTransformer { incoming in
            var outgoing = incoming
            outgoing.font = UIFont.systemFont(ofSize: 12)
            return outgoing
        }
        configuration.baseForegroundColor = .black
        rewardsButton.configuration = configuration
    }
    
    func layout() {
        addSubview(balanceView)
        addSubview(rewardsButton)
        addSubview(rewardsGraphView)
        addSubview(starRewardsView)
        addSubview(detailsButton)
        
        heightConstraint = starRewardsView.heightAnchor.constraint(equalToConstant: 0)
        
        NSLayoutConstraint.activate([
            balanceView.topAnchor.constraint(equalTo: topAnchor),
            balanceView.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 2)
        ])
        
        NSLayoutConstraint.activate([
            rewardsButton.centerYAnchor.constraint(equalTo: balanceView.pointsLabel.centerYAnchor),
            trailingAnchor.constraint(equalToSystemSpacingAfter: rewardsButton.trailingAnchor, multiplier: 3)
        ])
        
        NSLayoutConstraint.activate([
            rewardsGraphView.topAnchor.constraint(equalToSystemSpacingBelow: balanceView.bottomAnchor, multiplier: 1),
            rewardsGraphView.centerXAnchor.constraint(equalTo: centerXAnchor),
            rewardsGraphView.widthAnchor.constraint(equalToConstant: frame.width),
            rewardsGraphView.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 2)
        ])
        
        NSLayoutConstraint.activate([
            starRewardsView.topAnchor.constraint(equalTo: rewardsGraphView.bottomAnchor, constant: 8),
            starRewardsView.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 1),
            trailingAnchor.constraint(equalToSystemSpacingAfter: starRewardsView.trailingAnchor, multiplier: 1),
            heightConstraint!
        ])
        
        NSLayoutConstraint.activate([
            detailsButton.topAnchor.constraint(equalToSystemSpacingBelow: starRewardsView.bottomAnchor, multiplier: 2),
            detailsButton.leadingAnchor.constraint(equalTo: balanceView.leadingAnchor),
            bottomAnchor.constraint(equalToSystemSpacingBelow: detailsButton.bottomAnchor, multiplier: 2)
            
        ])
        
        starRewardsView.isHidden = true
    }
    
    // Redraw our graph once we know our actual device width & height
    override func layoutSubviews() {
        super.layoutSubviews()
        
        rewardsGraphView.actualFrameWidth = frame.width
        rewardsGraphView.drawRewardsGraph()
    }
}

extension RewardTileView {
    @objc func rewardOptionsTapped() {
        if heightConstraint?.constant == 0 {
            self.setChevron(image: "chevron.down")
            
            let heightAnimator = UIViewPropertyAnimator(duration: 0.75, curve: .easeInOut) {
                self.heightConstraint?.constant = 270
                self.layoutIfNeeded()
            }
            heightAnimator.startAnimation()
            
            let alphaAnimator = UIViewPropertyAnimator(duration: 0.25, curve: .easeInOut) {
                self.starRewardsView.isHidden = false
                self.starRewardsView.alpha = 1
            }
            alphaAnimator.startAnimation(afterDelay: 0.5)
        } else {
            self.setChevron(image: "chevron.up")
            
            let animator = UIViewPropertyAnimator(duration: 0.75, curve: .easeInOut) {
                self.heightConstraint?.constant = 0
                self.starRewardsView.isHidden = true
                self.starRewardsView.alpha = 0
                self.layoutIfNeeded()
            }
            animator.startAnimation()
        }
    }
    
    private func setChevron(image systemName: String) {
        let configuration = UIImage.SymbolConfiguration(scale: .small)
        let img = UIImage(systemName: systemName, withConfiguration: configuration)
        rewardsButton.setImage(img, for: .normal)
    }
}
