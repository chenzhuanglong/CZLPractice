//
//  CalculatorBrain.swift
//  ZLSPAR
//
//  Created by yuzeux on 2017/12/27.
//  Copyright © 2017年 晶石. All rights reserved.
//

import Foundation

func changSign(operand: Double) -> Double {
    return -operand
}

struct CalculatorBrain {
    
    private var accumulator: Double?
    
    private enum Operation {
        case constant(Double)
        case unaryOperation((Double) -> Double)
        case binaryOperation((Double,Double) -> Double)
        case equals
    }
    
    private var operations: Dictionary<String,Operation> = [
        "π"     : Operation.constant(Double.pi),
        "e"     : Operation.constant(M_E),
        "√"     : Operation.unaryOperation(sqrt),
        "cos"   : Operation.unaryOperation(cos),
        "tan"   : Operation.unaryOperation(tan),
        "😀"    : Operation.unaryOperation(changSign),
//        "+"     : Operation.binaryOperation(),
//        "-"     : Operation.binaryOperation(),
//        "x"     : Operation.binaryOperation(),
//        "÷"     : Operation.binaryOperation(),
//        "÷"     : Operation.equals,
    ]
    
    
    mutating func performOperation(_ symbol: String) {
        if let operation = operations[symbol] {
            switch operation {
            case .constant(let value):
                accumulator = value
            case .unaryOperation(let function):
                if accumulator != nil {
                    accumulator = function(accumulator!)
                }
                break
            case .binaryOperation(_):
                <#code#>
            case .equals:
                <#code#>
            }
        }
    }
    
    mutating func  setOperand(_ operand: Double) {
          accumulator = operand
    }
    
    var result: Double? {
        get {
            return accumulator
        }
    }
    
}
