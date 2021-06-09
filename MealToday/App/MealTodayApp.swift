//
//  MealTodayApp.swift
//  MealToday
//
//  Created by Geonhyeong LIm on 2021/05/17.
//

import SwiftUI

@main
struct MealTodayApp: App {

    init() {
        DIContainer.registerDependencies()
    }

    var body: some Scene {
        WindowGroup {
            AppView()
        }
    }
}

extension DIContainer {
    static func registerDependencies() {
        DIContainer.shared.register(DefaultShortcutUseCase() as ShortcutUseCase)
        DIContainer.shared.register(DefaultSelectionUseCase(repository: DefaultFoodRepository()) as SelectionUseCase)
        DIContainer.shared.register(AppState())
    }
}
