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
            selectionUseCase.setMode(with: 1)
            appState.viewRouting = .selecting // set default to 2p
        }

        func routeToSelectingView2p() {
            selectionUseCase.setMode(with: 2)
            appState.viewRouting = .selecting2p
        }

        func routeToResultView(with shortcut: Shortcut) {
            selectionUseCase.setSelections(with: shortcut.selections)
            appState.viewRouting = .resultView
        }

        func deleteShortcut(index: Int) {
            shortcutUseCase.removeShorcut(id: shortcuts[index].id)
        }
    }
}
