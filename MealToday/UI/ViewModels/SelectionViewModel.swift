//
//  SelectionViewMOdel.swift
//  MealToday
//
//  Created by Geonhyeong LIm on 2021/05/26.
//

import SwiftUI
import Combine

extension SelectionView {
    final class ViewModel: ObservableObject {
        @Published var query: String = ""
        @Published var foodType: FoodType = FoodType.dessertOrMeal
        @Injected private var selectionUseCase: SelectionUseCase
        @Injected private var appState: AppState

        init() {
            getNextQuery()
        }

        func onYes() {
            selectionUseCase.addChoice(for: foodType, isChosen: true)
            getNextQuery()
        }

        func onNo() {
            selectionUseCase.addChoice(for: foodType, isChosen: false)
            getNextQuery()
        }

        // MARK: - Private
        private var cancelBag = Set<AnyCancellable>()

        private func getNextQuery() {
            selectionUseCase.getNextQuery().sink { [weak self] type in
                if let type = type {
                    self?.foodType = type
                    self?.query = type.rawValue
                } else {
                    self?.appState.viewRouting = .resultView
                }
            }.store(in: &cancelBag)
        }
    }
}
