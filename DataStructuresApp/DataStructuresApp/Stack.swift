//
//  Stack.swift
//  DataStructuresApp
//
//  Created by Wade, Sebastian (WING) on 28/01/2020.
//  Copyright © 2020 Wade, Sebastian (WING). All rights reserved.
//

import Foundation

class Stack {
    
    var stack = Array(repeating: 0, count: 10)
    var top: Int = -1
    
    func push(item: Int) {
        if (stack.count - top) > 1{
            top += 1
            stack[top] = item
        } else {
            print ("Cannot push; FULL")
        }
    }

    func pop() -> Int? {
        if top < 0 {
            //Cannot pop; EMPTY
            return nil
        } else {
            let item = stack[top]
            stack[top] = 0
            top -= 1
            return item
        }
    }

    func display() -> String? {
        if top < 0 {
            //Cannot diplay; EMPTY
            return nil
        } else {
            var stackString = ""
            for item in stack {
                if item != 0 {
                    stackString = stackString + String(item) + " "
                }
            }
            return stackString
        }
    }

    func peek() -> Int? {
        if top < 0 {
            // Cannot peek; EMPTY
            return nil
        } else {
            let topItem = stack[top]
            return topItem
        }
    }
}
