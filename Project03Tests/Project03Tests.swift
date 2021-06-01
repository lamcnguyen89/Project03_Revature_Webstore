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
    var sut: InnerViewReviewOrderViewController!


    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        try super.setUpWithError()
        sut = InnerViewReviewOrderViewController()

    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut = nil

        try super.tearDownWithError()
        
    }

    

    func testCalculateOrderFunction() throws {
        // given
           
        let orderData = [
            0 : ["price" : 425.50, "quantity" : 4],
            1 : ["price" : 200.50, "quantity" : 5],
            2 : ["price" : 300.50, "quantity" : 6],
            3 : ["price" : 600.50, "quantity" : 7],
            4 : ["price" : 500.50, "quantity" : 2]
        ]
        // when
        

        // then
        XCTAssertEqual(sut.calculateOrder(orderData), 5.00, "Calculate Order function works correctly")
        
    }
    


}
