//
//  PlanterTabbarController.swift
//  Planter
//
//  Created by Wenyuan Bao on 7/21/19.
//  Copyright © 2019 PlanTer. All rights reserved.
//

import UIKit

class PlanterTabbarController: UITabBarController {
    
    static var shared = PlanterTabbarController.setUpTabBarController()
    
    //TODO: replace with actual VCs
    private let calendarVC = ViewController()
    private let myPlantsVC = ViewController()
    private let myProfileVC = ViewController()
    
    private init() {
        super.init(nibName: nil, bundle: nil)
        setUpTabBar()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let controllers = [calendarVC, myPlantsVC, myProfileVC]
        self.viewControllers = controllers
    }
    
    private static func setUpTabBarController() -> PlanterTabbarController {
        let tab = PlanterTabbarController()
        
        tab.addChild(UINavigationController(rootViewController: tab.calendarVC))
        tab.addChild(UINavigationController(rootViewController: tab.myPlantsVC))
        tab.addChild(UINavigationController(rootViewController: tab.myProfileVC))
        
        tab.calendarVC.tabBarItem = UITabBarItem(title: nil, image: #imageLiteral(resourceName: "tab_calendar_icon"), tag: 0)
        tab.myPlantsVC.tabBarItem = UITabBarItem(title: nil, image: #imageLiteral(resourceName: "tab_plant_icon"), tag: 1)
        tab.myProfileVC.tabBarItem = UITabBarItem(title: nil, image: #imageLiteral(resourceName: "tab_profile_icon"), tag: 2)
        
        return tab
    }
    
    private func setUpTabBar() {
        tabBar.unselectedItemTintColor = .lightGray
        tabBar.itemSpacing = 60
        tabBar.itemWidth = 60
        tabBar.itemPositioning = .centered
        tabBar.tintColor = .cyan
        tabBar.barTintColor = .white
        selectedIndex = 0
    }
}

extension UITabBar {
    override open func sizeThatFits(_ size: CGSize) -> CGSize {
        super.sizeThatFits(size)
        guard let window = UIApplication.shared.keyWindow else {
            return super.sizeThatFits(size)
        }
        var sizeThatFits = super.sizeThatFits(size)
        sizeThatFits.height = window.safeAreaInsets.bottom + 100
        return sizeThatFits
    }
}
