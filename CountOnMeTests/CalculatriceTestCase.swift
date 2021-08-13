//
//  CalculatriceTestCase.swift
//  CountOnMeTests
//
//  Created by Dems on 12/07/2021.
//  Copyright © 2021 Vincent Saluzzo. All rights reserved.
//

import XCTest
@testable import CountOnMe

class CalculatriceTestCase: XCTestCase {
    var calculator: Calculator!

    override func setUp() {
        super.setUp()
        calculator = Calculator()
    }

    func testGivenIstanceOfCalculatrice_WhenAccessingIt_ThenItExists() {

        XCTAssertNotNil(calculator)
    }

    func testExpressionIsCorrect() {
        calculator.tappedNumber(nuberTxt: "+")

        XCTAssert(calculator.expressionIsCorrect == false)

        calculator.tappedNumber(nuberTxt: "3")
        calculator.calculate()

        XCTAssert(calculator.expressionIsCorrect == true)
    }

    func testTappeNumber() {
        calculator.tappedNumber(nuberTxt: "5")
        calculator.tappedNumber(nuberTxt: "9")
        calculator.tappedNumber(nuberTxt: "0")

        XCTAssert(calculator.elements.last == "590")
    }

    func testAddition() {

        calculator.tappedNumber(nuberTxt: "1")
        calculator.addition()
        calculator.tappedNumber(nuberTxt: "2")
        calculator.calculate()

        XCTAssert(calculator.elements.last == "3")
    }

    func testSubstration() {

        calculator.tappedNumber(nuberTxt: "3")
        calculator.substraction()
        calculator.tappedNumber(nuberTxt: "2")
        calculator.calculate()

        XCTAssert(calculator.elements.last == "1")
    }

    func testMultiplication() {

        calculator.tappedNumber(nuberTxt: "1")
        calculator.multiplication()
        calculator.tappedNumber(nuberTxt: "2")
        calculator.calculate()

        XCTAssert(calculator.elements.last == "2")
    }

    func testDivision() {

        calculator.tappedNumber(nuberTxt: "2")
        calculator.division()
        calculator.tappedNumber(nuberTxt: "2")
        calculator.calculate()

        XCTAssert(calculator.elements.last == "1")
    }

    func testNumberDecimal() {
        calculator.tappedNumber(nuberTxt: "7")
        calculator.division()
        calculator.tappedNumber(nuberTxt: "2")
        calculator.calculate()

        XCTAssert(calculator.elements.last == "3.5")
    }

    func testPriorité() {
        calculator.tappedNumber(nuberTxt: "8")
        calculator.addition()
        calculator.tappedNumber(nuberTxt: "2")
        calculator.multiplication()
        calculator.tappedNumber(nuberTxt: "3")
        calculator.substraction()
        calculator.tappedNumber(nuberTxt: "2")
        calculator.calculate()

        XCTAssert(calculator.elements.last == "12")
    }

    func testPriorité2() {
        calculator.tappedNumber(nuberTxt: "10")
        calculator.substraction()
        calculator.tappedNumber(nuberTxt: "2")
        calculator.division()
        calculator.tappedNumber(nuberTxt: "2")
        calculator.calculate()

        XCTAssert(calculator.elements.last == "9")
    }


    func testOperationSuccesifError() {
        calculator.tappedNumber(nuberTxt: "2")
        calculator.addition()
        calculator.addition()

        XCTAssert(calculator.canAddOperator == false)
    }

    func testdivsionZero(){

        calculator.tappedNumber(nuberTxt: "5")
        calculator.division()
        calculator.tappedNumber(nuberTxt: "0")

        XCTAssert(calculator.elements.last == "0")
    }

    func testNoZero(){
        calculator.tappedNumber(nuberTxt: "5")
        calculator.division()
        calculator.tappedNumber(nuberTxt: "5")

        XCTAssert(calculator.expressionNoZeroDivision == false)
    }


    func testclear() {
        calculator.tappedNumber(nuberTxt: "10")
        calculator.addition()
        calculator.tappedNumber(nuberTxt: "5")
        calculator.clear()

        XCTAssert(calculator.elements.last == nil)
    }

    func testExpressionIsdemended() {
        calculator.tappedNumber(nuberTxt: "10")
        calculator.addition()
        calculator.tappedNumber(nuberTxt: "5")

        XCTAssert(calculator.expressionHaveEnoughElement)
    }

    func testTXT() {
        calculator.tappedNumber(nuberTxt: "10")
        calculator.multiplication()
        calculator.tappedNumber(nuberTxt: "5")
        calculator.calculate()
        calculator.txtRecoveryCalculation = ""

        XCTAssert(calculator.elements.last == nil)
    }

    func testExpresion() {
        calculator.txtRecoveryCalculation = ""

        XCTAssert(calculator.expressionHaveResult == false)
    }
}
