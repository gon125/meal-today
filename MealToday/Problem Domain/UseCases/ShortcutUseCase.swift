//
//  ShortcutUseCase.swift
//  MealToday
//
//  Created by Geonhyeong LIm on 2021/05/17.
//

import Foundation
import Combine

protocol ShortcutUseCase {
    func getShortcuts() -> AnyPublisher<[Shortcut], Never>
    func createShortcut(name: String, selections: Selection)
}

#if DEBUG
struct StubShortcutUseCase: ShortcutUseCase {
    func getShortcuts() -> AnyPublisher<[Shortcut], Never> {
        Just(Shortcut.stub).eraseToAnyPublisher()
    }

    func createShortcut(name: String, selections: [FoodType: Bool]) {
        //
    }

}
#endif
