//
//  Project03UITests.swift
//  Project03UITests
//
//  Created by Lam Nguyen on 5/21/21.
//

import XCTest

class Project03UITests: XCTestCase {
    var app: XCUIApplication!

    // Setup code for the test(s)
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        try super.setUpWithError()
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    // Test General UI Functionality
    func testShoppingCartButton() {
        
        app/*@START_MENU_TOKEN@*/.staticTexts["    Menu"]/*[[".buttons[\"    Menu\"].staticTexts[\"    Menu\"]",".staticTexts[\"    Menu\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        let scrollViewsQuery = app.scrollViews
        scrollViewsQuery.otherElements.tables.staticTexts["First Product"].swipeDown()
        scrollViewsQuery.otherElements.staticTexts["[Category]"].tap()
        app/*@START_MENU_TOKEN@*/.scrollViews.containing(.other, identifier:"Vertical scroll bar, 1 page").element/*[[".scrollViews.containing(.other, identifier:\"Horizontal scroll bar, 1 page\").element",".scrollViews.containing(.other, identifier:\"Vertical scroll bar, 1 page\").element"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        scrollViewsQuery.children(matching: .other).element(boundBy: 0).children(matching: .other).element.swipeUp()
        app/*@START_MENU_TOKEN@*/.staticTexts["   Cart"]/*[[".buttons[\"   Cart\"].staticTexts[\"   Cart\"]",".staticTexts[\"   Cart\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.tables.children(matching: .cell).matching(identifier: "test, 2").element(boundBy: 1).otherElements.containing(.image, identifier:"test").element.swipeUp()
        app.buttons["    Menu"].tap()
        
    }
    




}
