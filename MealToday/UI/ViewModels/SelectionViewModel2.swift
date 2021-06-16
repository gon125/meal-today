//
//  SelectionViewMOdel.swift
//  MealToday
//
//  Created by Geonhyeong LIm on 2021/05/26.
//

import SwiftUI
import Combine

extension SelectionView2 {
    final class ViewModel: ObservableObject {
        @Published var query: String = ""
        @Published var foodType: FoodType = FoodType.dessertOrMeal
        @Injected private var selectionUseCase: SelectionUseCase
        @Injected private var appState: AppState
        private var selectedAll: Int = 2

        init() {
            getNextQuery()
        }

        func onYes1() {
            self.selectedAll = selectedAll - 1
            selectionUseCase.addChoice(for: foodType, isChosen: true)
            if(self.selectedAll == 0) {
                print("All selected")
                self.selectedAll = 2
                getNextQuery()
            }
        }

        func onNo1() {
            self.selectedAll = selectedAll - 1
            selectionUseCase.addChoice(for: foodType, isChosen: false)
            if(self.selectedAll == 0) {
                print("All selected")
                self.selectedAll = 2
                getNextQuery()
            }
        }
        
        func onYes2() {
            self.selectedAll = selectedAll - 1
            selectionUseCase.addChoice(for: foodType, isChosen: true)
            if(self.selectedAll == 0) {
                print("All selected")
                self.selectedAll = 2
                getNextQuery()
            }
        }

        func onNo2() {
            self.selectedAll = selectedAll - 1
            selectionUseCase.addChoice(for: foodType, isChosen: false)
            if(self.selectedAll == 0) {
                print("All selected")
                self.selectedAll = 2
                getNextQuery()
            }
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
