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

    static private var _uniqueId = 0
    static private var uniqueId: Int { _uniqueId += 1; return _uniqueId }
    static let defaultIcon = "star.fill"

    init(name: String, description: String = "", icon: String = Shortcut.defaultIcon, selections: Selections, color: CodableColor = .random) {
        self.id = Shortcut.uniqueId
        self.name = name
        self.description = description
        self.icon = icon
        self.selections = selections
        self.color = color
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
            alpha: .random(in: 0...1)
        )
    }
}

extension Shortcut {
    static let stub: [Shortcut] = [
        Shortcut(name: "다이어트 식단", selections: Selections.stub),
        Shortcut(name: "우울할 때", selections: Selections.stub),
        Shortcut(name: "비오는 날", selections: Selections.stub),
        Shortcut(name: "저녁 데이트", selections: Selections.stub)
    ]
}
#endif
