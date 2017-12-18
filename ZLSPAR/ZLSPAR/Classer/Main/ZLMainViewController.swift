//
//  ZLMainViewController.swift
//  ZLSPAR
//
//  Created by yuzeux on 2017/12/9.
//  Copyright © 2017年 晶石. All rights reserved.
//

import UIKit

class ZLMainViewController: ZLBaseViewController {
    let mainButton : UIButton = UIButton.init(type: .custom)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainButton.frame = CGRect.init(x: 100, y: 100, width: 100, height: 100)
        mainButton.backgroundColor = RandomColor
        self.view.addSubview(mainButton);
        //传递触摸对象（即点击的按钮），需要在定义action参数时，方法名称后面带上冒号
        mainButton.addTarget(self, action:#selector(tapped(_:)), for:.touchUpInside)
        
        
    }
    
    @objc func tapped(_ button:UIButton) {
        button.backgroundColor = RandomColor;
        
        let alertController = UIAlertController(title: "标题", message: "这个是UIAlertController的默认样式", preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "取消", style: .cancel, handler: nil)
        let okAction = UIAlertAction(title: "好的", style: .default, handler:nil)
        alertController.addAction(cancelAction)
        alertController.addAction(okAction)
        self.present(alertController, animated: true, completion: nil)
        print(button.size,button.y,button.x,button.origin,button.top,button.bottom,button.left,button.right,button.centerY,button.centerX)
    }

    

}
