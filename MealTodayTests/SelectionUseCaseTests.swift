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

    func testRevertChoice() throws {
        var usecase: SelectionUseCase = DefaultSelectionUseCase(repository: DefaultFoodRepository())
        let expectedQuery = FoodType.cake
        let expectedSelections: Selections = [.init(foodType: .cake, isChosen: true)]
        let expect1 = expectation(description: "expect1")
        let expect2 = expectation(description: "expect2")
        let expect3 = expectation(description: "expect3")
        let expect4 = expectation(description: "expect4")
        var query: FoodType?

        let cancel1 = usecase.getNextQuery().sink { print($0);expect1.fulfill() }
        wait(for: [expect1], timeout: 1)
        usecase.addChoice(for: .dessertOrMeal, isChosen: true)
        let cancel2 = usecase.getNextQuery().sink { print($0); expect2.fulfill() }
        wait(for: [expect2], timeout: 1)
        usecase.addChoice(for: .cake, isChosen: true)

        let cancel4 = usecase.getNextQuery().sink { print($0); expect4.fulfill() }
        wait(for: [expect4], timeout: 1)
        usecase.addChoice(for: .sweets, isChosen: true)
        usecase.revertLastChoice()

        let cancel3 = usecase.getNextQuery().sink { query = $0; expect3.fulfill() }
        wait(for: [expect3], timeout: 1)

        let selections = usecase.getSelections()

        XCTAssertNotNil(query)
        XCTAssertTrue(expectedQuery == query!)
        XCTAssertTrue(selections == expectedSelections)

    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
