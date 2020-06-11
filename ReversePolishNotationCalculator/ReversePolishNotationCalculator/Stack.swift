//
//  Stack.swift
//  ReversePolishNotationCalculator
//
//  Created by Wade, Sebastian (WING) on 10/06/2020.
//  Copyright © 2020 Wade, Sebastian (WING). All rights reserved.
//

import Foundation

struct Stack {
    
    var stack: [String] = []
    var top: Int = -1
    
    func peek() -> String {
        if top < 0 {
            let error = "Sorry but you cannot peek: Stack is EMPTY"
            print(error)
            return error
        } else {
            let topItem = stack[top]
            return topItem
        }
    }
    
    mutating func push(item: String) {
        stack.append(item)
        top = top + 1
    }
    
    mutating func pop() -> String {
        if top < 0 {
            let error = "Sorry but you cannot pop: Stack is EMPTY"
            print(error)
            return error
        } else {
            let topItem = stack.popLast()
            top -= 1
            return topItem!
        }
        
    }
    
}
