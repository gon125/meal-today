//
//  SelectionUseCaseTests.swift
//  MealTodayTests
//
//  Created by Geonhyeong LIm on 2021/06/09.
//

import XCTest
@testable import MealToday

class SelectionUseCaseTests: XCTestCase {

    func testGetFoodFromSelectionInOneSeconds() throws {
        var usecase: SelectionUseCase = DefaultSelectionUseCase(repository: DefaultFoodRepository())
        var result: Food?

        let expectation = expectation(description: "getFoodFromSelection")

        usecase.addChoice(for: .beverage, isChosen: true)
        let cancellable = usecase.getFoodFromSelection().sink {
            result = $0
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 1)
        cancellable.cancel()

        XCTAssertNotNil(result)

    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
