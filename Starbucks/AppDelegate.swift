//
//  AppDelegate.swift
//  Starbucks
//
//  Created by Gabriel Garcia Pimentel Mendonca on 04/08/23.
//

import UIKit

class StarBucksViewController: UIViewController {
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nil, bundle: nil)
        
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder: ) has not been implemented")
    }
    
    func commonInit() {
        
    }
    
    func setTabBarImage(imageName: String, title: String) {
        let configuration = UIImage.SymbolConfiguration(scale: .large)
        let image = UIImage(systemName: imageName, withConfiguration: configuration)
        
        tabBarItem = UITabBarItem(title: title, image: image, tag: 0)
    }
}

class ScanViewController: StarBucksViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .green
        title = "Scan"
    }
    
    override func commonInit() {
        setTabBarImage(imageName: "qrcode", title: "Scan")
    }
}

class OrderViewController: StarBucksViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .cyan
        title = "Order"
    }
    
    override func commonInit() {
        setTabBarImage(imageName: "arrow.up.bin.fill", title: "Order")
    }
}

class GiftViewController: StarBucksViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .blue
        title = "Gift"
    }
    
    override func commonInit() {
        setTabBarImage(imageName: "gift.fill", title: "Gift")
    }
}

class StoreViewController: StarBucksViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .brown
        title = "Stores"
    }
    
    override func commonInit() {
        setTabBarImage(imageName: "location.fill", title: "Stores")
    }
}

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.backgroundColor = .systemBackground
        
        let homeVC = HomeViewController()
        let scanVC = ScanViewController()
        let orderVC = OrderViewController()
        let giftVC = GiftViewController()
        let storeVC = StoreViewController()
        
//        let homeNC = UINavigationController(rootViewController: homeVC)
        let scanNC = UINavigationController(rootViewController: scanVC)
        let orderNC = UINavigationController(rootViewController: orderVC)
        let giftNC = UINavigationController(rootViewController: giftVC)
        let storeNC = UINavigationController(rootViewController: storeVC)
        
        let tabBarViewController = UITabBarController()
        
        tabBarViewController.viewControllers = [homeVC, scanNC, orderNC, giftNC, storeNC]
        
        window?.rootViewController = tabBarViewController
        
        tabBarViewController.tabBar.tintColor = .lightGreen
        tabBarViewController.tabBar.isTranslucent = false
        tabBarViewController.tabBar.backgroundColor = .systemBackground
        
        return true
    }
}

