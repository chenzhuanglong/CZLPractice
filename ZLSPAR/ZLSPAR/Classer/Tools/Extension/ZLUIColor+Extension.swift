//
//  ZLUIColor+Extension.swift
//  ZLSPAR
//
//  Created by yuzeux on 2017/12/9.
//  Copyright © 2017年 晶石. All rights reserved.
//

import Foundation
import UIKit

/// 随机颜色
public var RandomColor : UIColor {
    let hue  =  CGFloat(arc4random()).truncatingRemainder(dividingBy: 256.0)  / 256.0;
    let saturation = ((CGFloat(arc4random()).truncatingRemainder(dividingBy: 128.0)) / 256.0 ) + 0.5
    let brightness = ((CGFloat(arc4random()).truncatingRemainder(dividingBy: 128.0)) / 256.0 ) + 0.5
    return UIColor.init(red:hue, green: saturation, blue:brightness, alpha: 1)
}

/// UIColor
///
/// - Parameters:
///   - r: 红
///   - g: 绿
///   - b: 蓝
///   - a: 透明度
/// - Returns: UIColor
public func RGBA(r: CGFloat, g: CGFloat, b: CGFloat, a: CGFloat) -> UIColor {
    let color = UIColor.init(red: r / 255, green: g / 255, blue: b / 255, alpha: a)
    return color
}

/// UIColor
///
/// - Parameters:
///   - red: 红
///   - green: 绿
///   - blue: 蓝
/// - Returns: UIColor
public func RGB(r: CGFloat, g: CGFloat, b: CGFloat) -> UIColor {
    return RGBA(r: r, g: g, b: b, a: 1)
}



