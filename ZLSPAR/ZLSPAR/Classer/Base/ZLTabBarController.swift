//
//  ZLTabBarController.swift
//  ZLSPAR
//
//  Created by yuzeux on 2017/12/9.
//  Copyright © 2017年 晶石. All rights reserved.
//

import UIKit

class ZLTabBarController: UITabBarController {
    
    let tabBarHeight: CGFloat = 50;

    override func viewDidLoad() {
        super.viewDidLoad()
        
        initMainView();
    }
    
    
    func initMainView() {
        
        let nav1 = ZLNavigationController.init(rootViewController: ZLMainViewController())
        nav1.tabBarItem.image = UIImage.init(named: "Home_Normal")
        nav1.tabBarItem.selectedImage = UIImage.init(named: "Home_Normal_S")
        nav1.tabBarItem.title = "首页"
        nav1.tabBarItem.tag = 1
        
        
        let nav2 = ZLNavigationController.init(rootViewController: ZLMineViewController())
        nav2.tabBarItem.image = UIImage.init(named: "Home_Normal")
        nav2.tabBarItem.selectedImage = UIImage.init(named: "Home_Normal_S")
        nav2.tabBarItem.title = "我的"
        nav2.tabBarItem.tag = 2
        
        self.viewControllers = [nav1,nav2]
        
        let tabBarAppearance = UITabBarItem.appearance()
        tabBarAppearance.setTitleTextAttributes([NSAttributedStringKey.foregroundColor : RGB(r: 135, g: 135, b: 135)], for: .normal)
        tabBarAppearance.setTitleTextAttributes([NSAttributedStringKey.foregroundColor : RGB(r: 254, g: 61, b: 189)], for: .selected)
    tabBarAppearance.setTitleTextAttributes([NSAttributedStringKey.font :UIFont.systemFont(ofSize: 10)], for: .normal)
        
        tabBarAppearance.titlePositionAdjustment = UIOffsetMake(0, -2)
}
    
    
    
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        var tabFrame = self.tabBar.frame
        tabFrame.size.height = tabBarHeight
        tabFrame.origin.y = self.view.frame.size.height - tabBarHeight
        self.tabBar.frame = tabFrame;
    }

}
