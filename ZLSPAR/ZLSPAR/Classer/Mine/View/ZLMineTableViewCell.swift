//
//  ZLMineTableViewCell.swift
//  ZLSPAR
//
//  Created by yuzeux on 2017/12/11.
//  Copyright © 2017年 晶石. All rights reserved.
//

import UIKit

class ZLMineTableViewCell: UITableViewCell {
    

    let mineLabel : UILabel = UILabel.init()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        // 设置选中cell时无高亮等效果
        self.selectionStyle = .none
        self.backgroundColor = RandomColor
        
        mineLabel.textColor = RandomColor
        mineLabel.font = UIFont.systemFont(ofSize: 20)
        mineLabel.textAlignment = .center
        mineLabel.frame = CGRect.init(x: 0, y: 0, width: ZLScreenWidth, height: 100)
        self.addSubview(mineLabel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
       
    }
    
    public func addMineTitle(title:String){
        mineLabel.text = title
    }
    
    

}
