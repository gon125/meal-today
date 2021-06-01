//
//  ShortcutUseCaseTests.swift
//  MealTodayTests
//
//  Created by Geonhyeong LIm on 2021/06/01.
//

import XCTest
import Combine
@testable import MealToday

class ShortcutUseCaseTests: XCTestCase {

    func testGetShortcutsInOneSec() throws {
        let shortcutUseCase: ShortcutUseCase = DefaultShortcutUseCase()
        let expectedValue = 0...
        var actualValue: Int?
        let expectation = expectation(description: "shortcutCount")
        let cancellable = shortcutUseCase.getShortcuts().sink { actualValue = $0.count
            if let actualValue = actualValue, expectedValue.contains(actualValue) {
                expectation.fulfill()
            }
        }
        wait(for: [expectation], timeout: 1)
        XCTAssertNotNil(cancellable)
    }

    func testAddOneShortcut() throws {
        let shorcutUseCase: ShortcutUseCase = DefaultShortcutUseCase()
        var shortcutCountBefore: Int?
        var shortcutCountAfter: Int?
        let expectation = expectation(description: "shortcutsCount")
        let cancellable = shorcutUseCase.getShortcuts().sink {
            if shortcutCountBefore == nil {
                shortcutCountBefore = $0.count
            } else {
                shortcutCountAfter = $0.count
                expectation.fulfill()
            }
        }
        XCTAssertNotNil(cancellable)
        shorcutUseCase.addShortcut(name: "배 고플 때", selections: Selections.stub)

        wait(for: [expectation], timeout: 1)

        XCTAssertTrue(shortcutCountBefore! + 1 == shortcutCountAfter!)
    }

    func testDeleteFirstShorcut() throws {
        let shortcutUseCase: ShortcutUseCase = DefaultShortcutUseCase()
        let waitForGetFirstShortcut = expectation(description: "waitForGetFisrtShortcut")
        let expectation = expectation(description: "shortcutsCount")
        var shortcutToDelete: Shortcut?
        var shortcutsAfterDelete: [Shortcut]?
        let cancellable = shortcutUseCase.getShortcuts().sink {
            if shortcutToDelete == nil {
                shortcutToDelete = $0.first
                waitForGetFirstShortcut.fulfill()
            } else {
                shortcutsAfterDelete = $0
                expectation.fulfill()
            }
        }
        XCTAssertNotNil(cancellable)
        wait(for: [waitForGetFirstShortcut], timeout: 1)
        shortcutUseCase.removeShorcut(id: shortcutToDelete!.id)
        wait(for: [expectation], timeout: 1)
        XCTAssertTrue(!shortcutsAfterDelete!.contains(shortcutToDelete!))
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
