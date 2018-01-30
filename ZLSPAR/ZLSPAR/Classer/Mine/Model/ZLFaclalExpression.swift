//
//  ZLFaclalExpression.swift
//  ZLSPAR
//
//  Created by yuzeux on 2018/1/29.
//  Copyright © 2018年 晶石. All rights reserved.
//

import UIKit

struct ZLFaclalExpression {
    
    enum Eyes: Int {
        case open
        case closed
        case squinting
    }
    
    enum Mouth: Int {
        case frown
        case smirk
        case neutral
        case grin
        case smile
        
        var sadder: Mouth {
            return Mouth(rawValue: rawValue - 1) ?? .frown
        }
        var happier: Mouth {
            return Mouth(rawValue:rawValue + 1 ) ?? .smile
        }
    }
    
    var sadder: ZLFaclalExpression {
        return ZLFaclalExpression(eyes: self.eyes, mouth: self.mouth.sadder)
    }
    
    var happier: ZLFaclalExpression {
        return ZLFaclalExpression(eyes: self.eyes, mouth: self.mouth.happier)
    }
    
    let eyes: Eyes
    let mouth: Mouth

}
