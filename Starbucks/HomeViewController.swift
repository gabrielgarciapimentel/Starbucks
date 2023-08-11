//
//  ViewController.swift
//  Starbucks
//
//  Created by Gabriel Garcia Pimentel Mendonca on 04/08/23.
//

import UIKit

class HomeViewController: StarBucksViewController {
    
    let statusBarView = UIView()
    let headerView = HomeHeaderView()
    let scrollView = UIScrollView()
    let stackView = UIStackView()
    let scanButton = UIButton()
    
    var headerViewTopConstraint: NSLayoutConstraint?
    
    struct ScanButtonSpacing {
        static let height: CGFloat = 60
        static let width: CGFloat = 170
    }
    
    let tiles = [
        RewardTileViewController(),
            TileViewController(title: "Breakfast mode meatless", subtitle: "Try the beyond Meat, Cheddar & Egg Breakfast Sandwich. Vegetarian and protein-packed.", imageName: "meatless"),
            TileViewController(title: "Uplifting our communities", subtitle: "Thanks to our partners' nominations. The Starbucks Foundation is donating $145K to more than 50 local charities.", imageName: "communities"),
            TileViewController(title: "Spend at least $15 for 50 bonus Stars", subtitle: "Collect 50 Bonus Stars when you spend at least $15 pre-tax.", imageName: "bonus"),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupScrollView()

        style()
        layout()
    }

    override func commonInit() {
        setTabBarImage(imageName: "house.fill", title: "Home")
    }
    
    func setupScrollView() {
        scrollView.delegate = self
    }
}

extension HomeViewController {
    func style() {
        view.backgroundColor = .backgroundWhite
        statusBarView.backgroundColor = .white
        
        statusBarView.translatesAutoresizingMaskIntoConstraints = false
        headerView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        stackView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.showsVerticalScrollIndicator = false
        
        stackView.axis = .vertical
        stackView.spacing = 8
        
        scanButton.translatesAutoresizingMaskIntoConstraints = false
        scanButton.setTitle("Scan in store", for: .normal)
        scanButton.titleLabel?.minimumScaleFactor = 0.5
        scanButton.titleLabel?.font = UIFont.preferredFont(forTextStyle: .title3)
        scanButton.titleLabel?.adjustsFontSizeToFitWidth = true
        scanButton.backgroundColor = .lightGreen
        scanButton.setTitleColor(.white, for: .normal)
        scanButton.layer.cornerRadius = ScanButtonSpacing.height/2
        
        headerView.delegate = self
    }
    
    func layout() {
        view.addSubview(statusBarView)
        view.addSubview(headerView)
        view.addSubview(scrollView)
        view.addSubview(scanButton)
        
        scrollView.addSubview(stackView)
        
        for tile in tiles {
            addChild(tile)
            stackView.addArrangedSubview(tile.view)
            tile.didMove(toParent: self)
        }
        
        headerViewTopConstraint = headerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor)
        
        NSLayoutConstraint.activate([
            statusBarView.topAnchor.constraint(equalTo: view.topAnchor),
            statusBarView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            statusBarView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            statusBarView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor)
        ])
        
        NSLayoutConstraint.activate([
            headerViewTopConstraint!,
            headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 8),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            
            stackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        ])
        
        NSLayoutConstraint.activate([
            scanButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -16),
            scanButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            scanButton.heightAnchor.constraint(equalToConstant: ScanButtonSpacing.height),
            scanButton.widthAnchor.constraint(equalToConstant: ScanButtonSpacing.width)
        ])
    }
}

extension HomeViewController: UIScrollViewDelegate {
        func scrollViewDidScroll(_ scrollView: UIScrollView) {
            let y = scrollView.contentOffset.y
    
            let swipingDown = y <= 0
            let shouldSnap = y > 30
            let labelHeight = headerView.greeting.frame.height + 16 // label + spacer (102)
    
            UIView.animate(withDuration: 0.3) {
                self.headerView.greeting.alpha = swipingDown ? 1.0 : 0.0
            }
    
            UIViewPropertyAnimator.runningPropertyAnimator(withDuration: 0.3, delay: 0, options:  [], animations: {
                self.headerViewTopConstraint?.constant = shouldSnap ? -labelHeight : 0
                self.view.layoutIfNeeded()
            })
        }
}

extension HomeViewController: HomeHeaderViewDelegate {
    func didTapHistoryButton(_ sender: HomeHeaderView) {
        let navController = UINavigationController(rootViewController: HistoryViewController())
        present(navController, animated: true)
    }
}

