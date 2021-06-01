//
//  ShortcutModel+State+Error.swift
//  MealToday
//
//  Created by Geonhyeong LIm on 2021/05/17.
//

import Foundation

struct Shortcut: Model, Identifiable {
    let id: Int
    let name: String
    let description: String
    let icon: String
    let selections: Selections
    let color: CodableColor

    static var defaultIcon: String {
        let emojis = "😀🍔🔥☀️🥰😇😱🤬🍞"
        return String(emojis.randomElement()!)
    }

    fileprivate init(id: Int, name: String, description: String = "", icon: String = Shortcut.defaultIcon, selections: Selections, color: CodableColor = .random) {
        self.id = id
        self.name = name
        self.description = description
        self.icon = icon
        self.selections = selections
        self.color = color
    }
}

struct ShortcutStore: Codable {
    private(set) var shortcuts = [Shortcut]()

    private var uniqueShortcutId = 0

    var json: Data? {
        return try? JSONEncoder().encode(self)
    }

    init?(json: Data?) {
        if let json = json, let newShorcutStore = try? JSONDecoder().decode(ShortcutStore.self, from: json) {
            self = newShorcutStore
        } else {
            return nil
        }
    }

    init() {}

    mutating func addShortcut(name: String, description: String, selections: Selections, icon: String, color: CodableColor) {
        uniqueShortcutId += 1
        let shortcut = Shortcut(
            id: uniqueShortcutId,
            name: name,
            description: description,
            icon: icon,
            selections: selections,
            color: color
        )
        shortcuts.append(shortcut)
    }

    mutating func removeShortcut(id: Shortcut.ID) {
        guard let index = shortcuts.firstIndex(where: {$0.id == id}) else { return }
        shortcuts.remove(at: index)
    }

}

struct CodableColor: Model {
    let red: Double
    let green: Double
    let blue: Double
    let alpha: Double
}

#if DEBUG
extension CodableColor {
    static var random: Self {
        CodableColor(
            red: .random(in: 0...1),
            green: .random(in: 0...1),
            blue: .random(in: 0...1),
            alpha: .random(in: 0.5...1)
        )
    }
}

extension Shortcut {
    static let stub: [Shortcut] = [
        Shortcut(id: 1, name: "다이어트 식단", selections: Selections.stub),
        Shortcut(id: 2, name: "우울할 때", selections: Selections.stub),
        Shortcut(id: 3, name: "비오는 날", selections: Selections.stub),
        Shortcut(id: 4, name: "저녁 데이트", selections: Selections.stub)
    ]
}
#endif
