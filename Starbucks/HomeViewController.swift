//
//  ViewController.swift
//  Starbucks
//
//  Created by Gabriel Garcia Pimentel Mendonca on 04/08/23.
//

import UIKit

class HomeViewController: StarBucksViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavBar()
    }

    override func commonInit() {
        setTabBarImage(imageName: "house.fill", title: "Home")
    }
    
    func setupNavBar() {
        navigationController?.navigationBar.topItem?.title = "Good afternoon, Gabriel ☀️"
    }
}

