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
        @Injected private var selectionUseCase: SelectionUseCase
        @Injected private var shortcutUseCase: ShortcutUseCase

        init() {
            selectFood()
        }

        func retry() {
            selectFood()
        }

        // MARK: - Private
        private var cancelBag = Set<AnyCancellable>()
        private func selectFood() {
            selectionUseCase.getFoodFromSelection().sink { [weak self] in
                self?.foodName = $0?.name ?? "없습니다 ㅜㅡㅠ"
            }.store(in: &cancelBag)
        }
    }
}
