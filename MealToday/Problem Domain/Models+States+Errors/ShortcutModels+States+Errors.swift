//
//  ShortcutModel+State+Error.swift
//  MealToday
//
//  Created by Geonhyeong LIm on 2021/05/17.
//

import Foundation

struct Shortcut: Model {
    let name: String
    let selections: [FoodType: Bool]

}

#if DEBUG
extension Shortcut {
    static let stub: [Shortcut] = [
        Shortcut(name: "다이어트 식단", selections: Selection.stub),
        Shortcut(name: "우울할 때", selections: Selection.stub),
        Shortcut(name: "비오는 날", selections: Selection.stub),
        Shortcut(name: "저녁 데이트", selections: Selection.stub)
    ]
}
#endif
