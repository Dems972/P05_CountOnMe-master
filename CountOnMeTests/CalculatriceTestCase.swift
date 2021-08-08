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

    func <#name#>() {
        <#function body#>
    }
        // 2 operation qui ne ce suive pas
    // changer calcule & gere les nopbre a virguel
        



}
