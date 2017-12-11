//
//  ZLUIView+Extension.swift
//  ZLSPAR
//
//  Created by yuzeux on 2017/12/11.
//  Copyright © 2017年 晶石. All rights reserved.
//

import Foundation
import UIKit


extension UIView {
    
    /// 大小
    public var size: CGSize {
        get{
            return self.frame.size
        }
        set {
            var r = self.frame
            r.size = newValue
            self.frame = r
        }
        
    }
    

    /// 位置
    public var origin: CGPoint {
        get{
            return self.frame.origin
        }
        set {
            var r = self.frame
            r.origin = newValue
            self.frame = r
        }
    }
    
    
    /// 左
    public var left: CGFloat {
        get{
            return origin.x
        }
        set{
            var r = self.frame
            r.origin.x = newValue
            self.frame = r
        }
    }
    
    
    /// 右
    public var right: CGFloat {
        get{
            return origin.x + width
        }
        set{
            var r = self.frame
            r.origin.x = newValue - width
            self.frame = r
        }
    }
    
    
    /// 上
    public var top: CGFloat {
        get{
            return origin.y
        }
        set{
            var r = self.frame
            r.origin.y = newValue
            self.frame = r
        }
    }
    
    
    /// 下(底部)
    public var bottom: CGFloat {
        get{
            return origin.x + height
        }
        set{
            var r = self.frame
            r.origin.x = newValue - height
            self.frame = r
        }
    }
    
    /// x坐标
    public var x: CGFloat {
        get{
            return origin.x
        }
        set{
            var r = self.frame
            r.origin.x = newValue
            self.frame = r
        }
    }
    
    /// y坐标
    public var y: CGFloat {
        get{
            return origin.y
        }
        set{
            var r = self.frame
            r.origin.y = newValue
            self.frame = r
        }
    }
    
    /// 宽
    public var width: CGFloat {
        get{
            return size.width
        }
        set{
            var r = self.frame
            r.size.width = newValue
            self.frame = r
        }
    }
    
    /// 高
    public var height: CGFloat {
        get{
            return size.height
        }
        set{
            var r = self.frame
            r.size.height = newValue
            self.frame = r
        }
    }
    
    /// 中心点X
    public var centerX: CGFloat {
        get{
            return self.center.x
        }
        set{
            self.center = CGPoint.init(x: newValue, y: centerY)
        }
    }
    
    /// 中心Y
    public var centerY: CGFloat {
        get{
            return self.center.y
        }
        set{
            self.center = CGPoint.init(x: centerX, y: newValue)
        }
    }
    
    
    
    
}

