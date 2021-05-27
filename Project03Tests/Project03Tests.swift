//
//  Project03Tests.swift
//  Project03Tests
//
//  Created by Lam Nguyen on 5/21/21.
//

import XCTest
@testable import Project03



class Project03Tests: XCTestCase {
    
    // SUT stands for System under Test. It is the class that we are perofrming tests upon.
    var sut: LoginViewController!
    var sut2: CategoryViewController!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        try super.setUpWithError()
        sut = ViewController()
        sut2 = CategoryViewController()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut = nil
        sut2 = nil
        try super.tearDownWithError()
        
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testViewController() throws {
        // given
            let input1 = 2
            let input2 = 3
        // when
        
        // then
        XCTAssertEqual(sut.adder(input1: input1, input2: input2), 5, "Adder function adds correctly")
        
    }
    
    func testCategoryViewController() throws {
        // given
        let input1 = 2
        let input2 = 3
        
        // then
        XCTAssertEqual(sut2.subtractor(input1: input1, input2: input2), -1, "Subtractor function subtracts correctly")
    }

}
