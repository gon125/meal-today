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
    func addShortcut(name: String, selections: Selections, icon: String, color: CodableColor)
    func removeShorcut(id: Shortcut.ID)
}

extension ShortcutUseCase {
    func addShortcut(name: String, selections: Selections, icon: String = Shortcut.defaultIcon, color: CodableColor = .random) {
        addShortcut(name: name, selections: selections, icon: icon, color: color)
    }
}

#if DEBUG
struct StubShortcutUseCase: ShortcutUseCase {
    func removeShorcut(id: Shortcut.ID) {
        //
    }

    func getShortcuts() -> AnyPublisher<[Shortcut], Never> {
        Just(Shortcut.stub).eraseToAnyPublisher()
    }
}
#endif

class DefaultShortcutUseCase: ShortcutUseCase {

    @Published private var shortcutStore: ShortcutStore

    init() {
        let defaultKey = "ShortcutStore"
        shortcutStore = ShortcutStore(json: UserDefaults.standard.data(forKey: defaultKey)) ?? ShortcutStore()

        $shortcutStore.sink { UserDefaults.standard.set($0.json, forKey: defaultKey) }
            .store(in: &cancelBag)

    }

    func getShortcuts() -> AnyPublisher<[Shortcut], Never> {
        $shortcutStore.map { $0.shortcuts }.eraseToAnyPublisher()
    }

    func addShortcut(name: String, selections: Selections, icon: String, color: CodableColor) {
        var description = selections.filter { $0.value == true }.keys.reduce("", { $0 + $1.rawValue + ", "})
        _ = description.popLast()
        _ = description.popLast()
        shortcutStore.addShortcut(
            name: name,
            description: description,
            selections: selections,
            icon: icon,
            color: color
        )
    }

    func removeShorcut(id: Shortcut.ID) {
        shortcutStore.removeShortcut(id: id)
    }

    // MARK: - Private
    private var cancelBag = Set<AnyCancellable>()
}
