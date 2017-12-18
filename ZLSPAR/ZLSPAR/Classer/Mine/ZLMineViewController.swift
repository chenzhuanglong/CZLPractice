//
//  ZLMineViewController.swift
//  ZLSPAR
//
//  Created by yuzeux on 2017/12/9.
//  Copyright © 2017年 晶石. All rights reserved.
//

import UIKit

class ZLMineViewController: ZLBaseViewController,UITableViewDelegate,UITableViewDataSource {
    
    lazy var tableView : UITableView = {
        let tableView = UITableView.init(frame: CGRect.init(x: 0, y: 64, width: ZLScreenWidth, height: ZLScreenHeight - 64 - 44), style: .plain)
        tableView.delegate = self
        tableView.dataSource = self
        self.view.addSubview(tableView)
        
        return tableView;
    }()
    
    lazy var data : NSMutableArray = {
        let data = NSMutableArray.init()
        return data
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.loadData();
    }
    
    func loadData() {
        let array = [1,2,3,4,5,6]
   
        for dic in array {
            data.add(dic)
        }
        
        tableView.reloadData()
    }
    

    // 每个节点返回的row的行数
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    // 返回每行的cell的视图
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
//        var cell = tableView.dequeueReusableCell(withIdentifier: "cell")
//        if cell == nil {
//            cell = UITableViewCell.init(style: .default, reuseIdentifier: "cell")
//        }
        
        
        let ID = "cell"//设置标记
        
        let  cell = ZLMineTableViewCell(style:.default, reuseIdentifier: ID)
    
        cell.addMineTitle(title: "\(data[indexPath.item])")
        
        
        return cell//返回cell
        
    }
    
    // 设置cell的高度
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.item)
    }
    
    
    
    

}
