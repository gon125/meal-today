//
//  ShortcutViewModel.swift
//  MealToday
//
//  Created by Geonhyeong LIm on 2021/05/26.
//

import SwiftUI

extension ShortcutView {
    final class ViewModel: ObservableObject {
        @Published var shortcuts: [Shortcut] = [Shortcut]()
        @Injected private var shortcutUseCase: ShortcutUseCase
        @Injected private var selectionUseCase: SelectionUseCase
        @Injected private var appState: AppState

        init() {
            shortcutUseCase.getShortcuts().assign(to: &$shortcuts)
        }

        func routeToSelectingView() {
            appState.viewRouting = .selecting
        }

        func routeToResultView(with shortcut: Shortcut) {
            selectionUseCase.setSelections(with: shortcut.selections)
            appState.viewRouting = .resultView
        }
    }
}
