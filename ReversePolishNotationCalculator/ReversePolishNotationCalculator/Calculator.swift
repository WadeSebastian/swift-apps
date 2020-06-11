//
//  Calculator.swift
//  ReversePolishNotationCalculator
//
//  Created by Wade, Sebastian (WING) on 10/06/2020.
//  Copyright © 2020 Wade, Sebastian (WING). All rights reserved.
//

import Foundation

class Calculator {
     
    var expressionStack: Stack
    var expressionString: String = ""
    
    init() {
        let emptyStack = Stack()
        self.expressionStack = emptyStack
    }
    
    func addOperandToStack(operand: String) {
        expressionStack.push(item: operand)
        expressionString += operand
    }
    
    func clearStack() {
        expressionStack.stack = []
        expressionStack.top = -1
        expressionString = ""
    }
    
    //operator is already a keyword in swift so i had to lengthen it out (not just being longwinded for fun)
    func addOperatorToStack(arithmeticOperatorString: String) {
        if expressionStack.top >= 1 { //if the stack has at least two items...
            if let integer = Int(expressionStack.pop()) {
                let secondOperand = integer
                if let secondInteger = Int(expressionStack.pop()) {
                    let firstOperand = secondInteger
                    //determines the mathematical operator and calculates the result of the expression
                    var result: Int? = nil
                    if arithmeticOperatorString == "+" {
                        result = firstOperand + secondOperand
                    } else if arithmeticOperatorString == "-" {
                        result = firstOperand - secondOperand
                    } else if arithmeticOperatorString == "*" {
                        result = firstOperand * secondOperand
                    } else { //division: '/'
                        result = firstOperand / secondOperand
                    }
                    let resultString = String(result!)
                    expressionStack.push(item: resultString)
                    expressionString += arithmeticOperatorString
        //if the user hasn't inputed two operands before adding the operator...
                } else {
                    print ("Please enter two operands before adding an operator")
                }
            } else {
                print ("Please enter two operands before adding an operator")
            }
        } else {
            print ("Please enter two operands before adding an operator")
        }
    }
    
}
