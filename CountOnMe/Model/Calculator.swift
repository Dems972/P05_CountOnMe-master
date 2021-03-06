//
//  Calculatrice.swift
//  CountOnMe
//
//  Created by Dems on 12/07/2021.
//  Copyright © 2021 Vincent Saluzzo. All rights reserved.
//

import Foundation

class Calculator {

    // Allowing to store the text of the calculation
    var txtRecoveryCalculation: String = ""
    // Round the result if not a decimal number
    var resultString:String!
    // Array of selected elements
    var elements: [String] {
        return txtRecoveryCalculation.split(separator: " ").map { "\($0)" }
    }
    // Used to calculate the result
    var operationsToReduce = [String]()

    // Error check computed variables
    var expressionIsCorrect: Bool {
        return elements.last != "+" && elements.last != "-" && elements.last != "x" && elements.last != "/"
    }
    // Check if an operation has been demanded
    var expressionHaveEnoughElement: Bool {
        return elements.count >= 3
    }
    // Check if operator can be added
    var canAddOperator: Bool {
        return elements.last != "+" && elements.last != "-" && elements.last != "x" && elements.last != "/" && elements.first != nil
    }
    // Check if an operation has already been done
    var expressionHaveResult: Bool {
        return txtRecoveryCalculation.firstIndex(of: "=") != nil
    }
    // Check if no division by zero
    var expressionNoZeroDivision: Bool = false
    //Method for tapped number
    func tappedNumber(nuberTxt: String) {
        if expressionHaveResult {
            txtRecoveryCalculation = ""
        }
        txtRecoveryCalculation.append(nuberTxt)
    }
    //Method for addition
    func addition() {
        if canAddOperator {
            txtRecoveryCalculation.append(" + ")
       }
    }
    //Method for substraction
    func substraction() {
        if canAddOperator {
            txtRecoveryCalculation.append(" - ")
        }
    }
    //Method for multiplication
    func multiplication() {
        if canAddOperator {
            txtRecoveryCalculation.append(" x ")
        }
    }
    //Method for division
    func division() {
        if canAddOperator {
            txtRecoveryCalculation.append(" / ")
        }
    }
    //Method for Reset calculation
    func clear() {
        txtRecoveryCalculation.removeAll()
        operationsToReduce.removeAll()
    }
    //Method to remove the decimal of the Double if result is an integer
    func convertResult(result: Double) {
        if result == Double(Int(result)) {
            let round = Int(result)
            resultString = String(round)
        } else {
            resultString = String(result)
        }
    }
    //Method for calculation
    func calculate() {
        operationsToReduce = elements
        divisionZero()
        if expressionNoZeroDivision == false {
            while operationsToReduce.count > 1 {
            var indexPrio = 0
            let indexOfMulti = operationsToReduce.firstIndex(of: "x")
            let indexOfDivision = operationsToReduce.firstIndex(of: "/")

                if indexOfMulti == nil {
                    indexPrio = indexOfDivision ?? 1
                } else if indexOfDivision == nil {
                    indexPrio = indexOfMulti ?? 1
                } else {
                    if indexOfMulti! < indexOfDivision! {
                        indexPrio = indexOfMulti ?? 1
                    } else {
                        indexPrio = indexOfDivision ?? 1
                    }
                }

            let left = Double(operationsToReduce[indexPrio - 1])!
            let operand = operationsToReduce[indexPrio]
            let right = Double(operationsToReduce[indexPrio + 1])!

            let result: Double

            switch operand {
            case "x": result = left * right
            case "/": result = left / right
            case "+": result = left + right
            case "-": result = left - right
            default: fatalError("Unknown operator !")
            }
            convertResult(result: result)
            operationsToReduce.removeSubrange(indexPrio - 1...indexPrio + 1)
            operationsToReduce.insert(resultString, at: indexPrio - 1)
            }
        }
        txtRecoveryCalculation.append(" = \(operationsToReduce.first!)")
    }
    //Methode to check division by zero 
    func divisionZero()  {
        for reads_The_Elements in 0...elements.count - 1 {
            if reads_The_Elements > 1 && reads_The_Elements <= elements.count - 1 {
                if elements[reads_The_Elements - 1] == "/" && elements[reads_The_Elements] == "0" {
                    expressionNoZeroDivision = true
                } else {
                    expressionNoZeroDivision = false
                }
            }
        }
    }

}
