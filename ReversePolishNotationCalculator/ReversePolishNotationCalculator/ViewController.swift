//
//  ViewController.swift
//  ReversePolishNotationCalculator
//
//  Created by Wade, Sebastian (WING) on 10/06/2020.
//  Copyright © 2020 Wade, Sebastian (WING). All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var ExpressionDisplayLabel: UILabel!
    
    var currentOperand: String = ""
    let calculator = Calculator()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateDisplayLabel()
        
    }

    func updateDisplayLabel() {
        ExpressionDisplayLabel.text = calculator.expressionString
    }
    
    func checkOperandIsWithinAllowedRange(currentOperandString: String) -> Bool {
        if let currentOperand = Int(currentOperandString) {
            if (currentOperand <= 999) && (currentOperand >= -999) {
                return true
            } else {
                return false
            }
        } else {
            return false
        }
    }
    
    func addDigitToCurrentOperand(digit: String) {
        let temporaryOperand = currentOperand + digit
        let isInRange = checkOperandIsWithinAllowedRange(currentOperandString: temporaryOperand)
        if isInRange == true {
            currentOperand += digit
            calculator.expressionString += digit
            updateDisplayLabel()
        } else {
            ExpressionDisplayLabel.text = "Sorry but you can only enter operands between -999 and +999 inclusive."
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                self.updateDisplayLabel()
            }
        }
    }
    
    func addOperator(arithmeticOperatorString: String) {
        if currentOperand != "" {
            calculator.addOperandToStack(operand: currentOperand)
            currentOperand = ""
        }
        let errorMessage = calculator.addOperatorToStack(arithmeticOperatorString: arithmeticOperatorString)
        if errorMessage == nil {
            updateDisplayLabel()
        } else {
            ExpressionDisplayLabel.text = errorMessage
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                self.updateDisplayLabel()
            }
        }
    }
    
    @IBAction func sevenButtonPressed(_ sender: UIButton) {
        addDigitToCurrentOperand(digit: "7")
    }
    
    @IBAction func eightButtonPressed(_ sender: UIButton) {
        addDigitToCurrentOperand(digit: "8")
    }
    
    @IBAction func nineButtonPressed(_ sender: UIButton) {
        addDigitToCurrentOperand(digit: "9")
    }
    
    @IBAction func fourButtonPressed(_ sender: UIButton) {
        addDigitToCurrentOperand(digit: "4")
    }
    
    @IBAction func fiveButtonPressed(_ sender: UIButton) {
        addDigitToCurrentOperand(digit: "5")
    }
    
    @IBAction func sixButtonPressed(_ sender: UIButton) {
        addDigitToCurrentOperand(digit: "6")
    }
    
    @IBAction func oneButtonPressed(_ sender: UIButton) {
        addDigitToCurrentOperand(digit: "1")
    }
    
    @IBAction func twoButtonPressed(_ sender: UIButton) {
        addDigitToCurrentOperand(digit: "2")
    }
    
    @IBAction func threeButtonPressed(_ sender: UIButton) {
        addDigitToCurrentOperand(digit: "3")
    }
    
    @IBAction func zeroButtonPressed(_ sender: UIButton) {
        addDigitToCurrentOperand(digit: "0")
    }
    
    @IBAction func enterButtonPressed(_ sender: UIButton) {
        calculator.addOperandToStack(operand: currentOperand)
        currentOperand = ""
    }
    
    @IBAction func positiveNegativeButtonPressed(_ sender: UIButton) {
        if currentOperand.contains("-") == false { //positive
            let expressionBeforeMinus = calculator.expressionString.dropLast(currentOperand.count)
            let expressionAfterMinus = calculator.expressionString.dropFirst(calculator.expressionString.count - currentOperand.count)
            calculator.expressionString = expressionBeforeMinus + "-" + expressionAfterMinus
            currentOperand = "-" + currentOperand
            updateDisplayLabel()
        } else if currentOperand.contains("-") == true { //negative
            let expressionBeforeMinus = calculator.expressionString.dropLast(currentOperand.count)
            let expressionAfterMinus = calculator.expressionString.dropFirst(calculator.expressionString.count - currentOperand.count + 1)
            calculator.expressionString = String(expressionBeforeMinus + expressionAfterMinus)
            currentOperand = String(currentOperand.dropFirst(1))
            updateDisplayLabel()
        }
    }
    
    @IBAction func clearButtonPressed(_ sender: UIButton) {
        calculator.clearStack()
        currentOperand = ""
        updateDisplayLabel()
    }
    
    @IBAction func additionButtonPressed(_ sender: UIButton) {
        addOperator(arithmeticOperatorString: "+")
    }
    
    @IBAction func subtractionButtonPressed(_ sender: UIButton) {
        addOperator(arithmeticOperatorString: "-")
    }
    
    @IBAction func multiplicationButtonPressed(_ sender: UIButton) {
        addOperator(arithmeticOperatorString: "*")
    }
    
    @IBAction func divisionButtonPressed(_ sender: UIButton) {
        addOperator(arithmeticOperatorString: "/")
    }
    
    @IBAction func evaluateButtonPressed(_ sender: UIButton) {
        calculator.expressionString = calculator.expressionStack.stack[0]
        updateDisplayLabel()
    }
}

