//
//  TinkoffCalculatorUITests.swift
//  TinkoffCalculatorUITests
//
//  Created by t.khamidov on 24.01.2022.
//

import XCTest

class TinkoffCalculatorUITests: XCTestCase {

    override func setUp() {
        continueAfterFailure = false
    }

    override func tearDown() {
    }

    func test_lecture10_calculations() {
        let buttons = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "0", "C", "x", "/", "+", "-"]

        let app = XCUIApplication()
        app.launch()

        buttons.forEach {
            let button = app.buttons[$0]

            XCTAssertTrue(button.exists, "Не нашлась кнопка \($0).")
            XCTAssertTrue(button.isHittable, "Кнопка \($0) не нажимается.")
        }

        if !app.staticTexts["0"].exists {
            XCTFail("Не найден лейбл вывода решения.")
        }

        app.buttons["2"].tap()
        app.buttons["7"].tap()
        app.buttons["+"].tap()
        app.buttons["3"].tap()
        app.buttons["="].tap()

        if !app.staticTexts["30"].exists {
            XCTFail("Не найден лейбл вывода решения.")
        }

        app.buttons["-"].tap()
        app.buttons["9"].tap()
        app.buttons["7"].tap()
        app.buttons["="].tap()

        if !app.staticTexts["-67"].exists {
            XCTFail("Не найден лейбл вывода решения.")
        }

        app.buttons["/"].tap()
        app.buttons["2"].tap()
        app.buttons["="].tap()

        if !app.staticTexts["-33,5"].exists {
            XCTFail("Не найден лейбл вывода решения.")
        }

        app.buttons["x"].tap()
        app.buttons["1"].tap()
        app.buttons["1"].tap()
        app.buttons["0"].tap()
        app.buttons["="].tap()

        if !app.staticTexts["-3685"].exists {
            XCTFail("Не найден лейбл вывода решения.")
        }
    }
}
