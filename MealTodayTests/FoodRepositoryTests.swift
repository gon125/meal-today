//
//  FoodRepositoryTests.swift
//  MealTodayTests
//
//  Created by Geonhyeong LIm on 2021/06/01.
//

import XCTest
@testable import MealToday

class FoodRepositoryTests: XCTestCase {

    func testGetFood() throws {
        let foodRepository: FoodRepository = DefaultFoodRepository()
        let expectation = expectation(description: "foodReceived")
        let expectedFoodCount = 0...
        var actualFoodCount: Int?

        let cancellable = foodRepository.getFood(from: Selections.stub).sink {
            actualFoodCount = $0?.count
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 1)
        XCTAssertNotNil(cancellable)
        XCTAssertNotNil(actualFoodCount)
        XCTAssertTrue(expectedFoodCount.contains(actualFoodCount!))
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
