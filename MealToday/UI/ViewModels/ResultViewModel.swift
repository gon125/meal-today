//
//  ResultViewModel.swift
//  MealToday
//
//  Created by Geonhyeong LIm on 2021/05/26.
//

import SwiftUI
import Combine

extension ResultView {
    final class ViewModel: ObservableObject {
        @Published var foodName: String = ""
        var food: Food?
        @Injected private var selectionUseCase: SelectionUseCase
        @Injected private var shortcutUseCase: ShortcutUseCase
        @Injected private var appState: AppState
        @Injected private var mapUseCase: MapUseCase

        init() {
            selectFood()
        }

        func retry() {
            selectFood()
        }

        private var cancelBag = Set<AnyCancellable>()
        private func selectFood() {
            selectionUseCase.getFoodFromSelection().sink { [weak self] in
                self?.food = $0
                self?.foodName = $0?.name ?? "없습니다\nㅜㅡㅠ"
            }.store(in: &cancelBag)
        }

        func routeToShortcutView() {
            selectionUseCase.reset()
            appState.viewRouting = .shortcut
        }

        func saveShortcut(name: String, icon: String, color: CodableColor) {
            shortcutUseCase.addShortcut(name: name, selections: selectionUseCase.getSelections(), icon: icon, color: color)
        }

        func routeToMap() {
            guard let food = food else {
                return
            }
            mapUseCase.routeToMap(with: food)
        }
    }
}
