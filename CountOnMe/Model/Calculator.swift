//
//  Calculatrice.swift
//  CountOnMe
//
//  Created by Dems on 12/07/2021.
//  Copyright © 2021 Vincent Saluzzo. All rights reserved.
//

import Foundation

class Calculator {

    // Recover the calculation
    var txtRecoveryCalculation: String = ""

    // Array of elements
    var elements: [String] {
        return txtRecoveryCalculation.split(separator: " ").map { "\($0)" }
    }

    //
    var operationsToReduce = [String]()

    // Error check computed variables
    var expressionIsCorrect: Bool {
        return elements.last != "+" && elements.last != "-" && elements.last != "x" && elements.last != "/"
    }

    var expressionHaveEnoughElement: Bool {
        return elements.count >= 3
    }

    var canAddOperator: Bool {
        return elements.last != "+" && elements.last != "-" && elements.last != "x" && elements.last != "/" && elements.first != nil
    }

    var expressionHaveResult: Bool {
        return txtRecoveryCalculation.firstIndex(of: "=") != nil
    }

    var expressionNoZeroDivision: Bool = false


    func tappedNumber(nuberTxt: String) {
        if expressionHaveResult {
            txtRecoveryCalculation = ""
        }
        txtRecoveryCalculation.append(nuberTxt)
    }

    func addition() {
        if canAddOperator {
            txtRecoveryCalculation.append(" + ")
       }

        if expressionHaveResult {
            txtRecoveryCalculation = ""
        }
    }

    func substraction() {
        if canAddOperator {
            txtRecoveryCalculation.append(" - ")
        }
    }

    func multiplication() {
        if canAddOperator {
            txtRecoveryCalculation.append(" x ")
        }
    }

    func division() {
        if canAddOperator {
            txtRecoveryCalculation.append(" / ")
        }
    }

    func clear() {
        txtRecoveryCalculation.removeAll()
        operationsToReduce.removeAll()
    }

//    func calcul() -> String {
//        operationsToReduce = elements
//        while operationsToReduce.count > 1 {
//            let left = Int(operationsToReduce[0])!
//            let operand = operationsToReduce[1]
//            let right = Int(operationsToReduce[2])!
//
//            let result: Int
//            switch operand {
//            case "+": result = left + right
//            case "-": result = left - right
//            case "x": result = left * right
//            case "/": result = left / right
//            //case "=": return
//            default: fatalError("Unknown operator !")
//            }
//
//            operationsToReduce = Array(operationsToReduce.dropFirst(3))
//            operationsToReduce.insert("\(result)", at: 0)
//        }
//        print(operationsToReduce)
//        print(txtRecoveryCalculation)
//        return operationsToReduce.first ?? "Error"
//        txtRecoveryCalculation.append(" = \(operationsToReduce.first!)")
//
//    }

    func calculate() {
        operationsToReduce = elements

        if expressionHaveResult {
            txtRecoveryCalculation = ""
        } else {
            divisionZero()

    if expressionNoZeroDivision == false {
        print(expressionNoZeroDivision)
        while operationsToReduce.count > 1 {
            var indexPrio = 0
            let indexOfMulti = operationsToReduce.firstIndex(of: "x")
            let indexOfDivision = operationsToReduce.firstIndex(of: "/")


            if indexOfMulti == nil {
                indexPrio = indexOfDivision ?? 1
            } else if indexOfDivision == nil {
                indexPrio = indexOfMulti ?? 1
            }

            print(indexPrio)

            let left = Double(operationsToReduce[indexPrio - 1])!
            let operand = operationsToReduce[indexPrio]
            let right = Double(operationsToReduce[indexPrio + 1])!

            let result: Double

//            if operand == "/" {
//                if right == 0  {
//                    print("la division par zero est impossible")
//                }
//            }

            switch operand {
            case "x": result = left * right
            case "/": result = left / right
            case "+": result = left + right
            case "-": result = left - right
            case "=": return
            default: fatalError("Unknown operator !")
            }

            operationsToReduce.removeSubrange(indexPrio - 1...indexPrio + 1)
            operationsToReduce.insert("\(result)", at: indexPrio - 1)

          }
         }
        }
        print(operationsToReduce)
        print(txtRecoveryCalculation)
        txtRecoveryCalculation.append(" = \(operationsToReduce.first!)")

    }

    //fonction
    func divisionZero()  {
        for reads_The_Elements in 0...elements.count - 1 {
            print(reads_The_Elements," premier if ")
            if reads_The_Elements > 1 && reads_The_Elements <= elements.count - 1 {
                print(reads_The_Elements," je suis ds le 2 eme if")

                if elements[reads_The_Elements - 1] == "/" && elements[reads_The_Elements] == "0" {
                    print(reads_The_Elements," je suis ds la 3 eme if")
                    print("div impossible")
                    txtRecoveryCalculation = ""
                    expressionNoZeroDivision = true
                    print("oui",expressionNoZeroDivision)
                } else {
                    expressionNoZeroDivision = false
                    print("non",expressionNoZeroDivision)
                }
            }
        }
    }

}
